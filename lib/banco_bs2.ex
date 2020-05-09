defmodule BancoBs2 do
  @moduledoc """
    BancoBs2 SDK
  """
  @base_url Application.get_env(:banco_bs2, :base_url)
  @auth_endpoint "/auth/oauth/v2/token"
  @default_headers %{"Content-type": "application/x-www-form-urlencoded"}

  alias BancoBs2.ApiError
  alias BancoBs2.Entities.Client
  alias HTTPoison.Error
  alias HTTPoison.Response

  @doc """
    Authenticates using OAuth.

    If succesful, returns {:ok, %Client{}}, else {:error, %ApiError{}}.
  """
  @spec authenticate(String.t(), String.t()) :: {atom, Client.t() | ApiError.t()}
  def authenticate(grant_type \\ "password", scope \\ "forintegration") do
    params = %{
      grant_type: grant_type,
      scope: scope,
      username: Application.get_env(:banco_bs2, :account).user,
      password: Application.get_env(:banco_bs2, :account).pass
    }

    case HTTPoison.post("#{@base_url <> @auth_endpoint}", url_encoded(params), headers()) do
      {:ok, %Response{status_code: 200, body: body}} ->
        handle_success(Jason.decode!(body))

      {:ok, response} ->
        handle_error(response)

      {:error, %Error{reason: reason}} ->
        {:error, %ApiError{message: "Connection error occured: #{reason}"}}
    end
  end

  @doc """
    Authenticates using refresh_token. Returns
      {:ok, %Client{}} or {:err, %ApiError{}}
  """
  @spec refresh(String.t(), String.t(), String.t()) :: {atom, Client.t() | ApiError.t()}
  def refresh(refresh_token, grant_type \\ "refresh_token", scope \\ "forintegration") do
    params = %{
      grant_type: grant_type,
      scope: scope,
      refresh_token: refresh_token
    }

    case HTTPoison.post("#{@base_url <> @auth_endpoint}", url_encoded(params), headers()) do
      {:ok, %Response{status_code: 200, body: body}} ->
        handle_success(Jason.decode!(body))

      {:ok, response} ->
        handle_error(response)

      {:error, %Error{reason: reason}} ->
        {:error, %ApiError{message: "Connection error occured: #{reason}"}}
    end
  end

  defp handle_success(body) do
    client = %Client{
      access_token: body["access_token"],
      token_type: body["token_type"],
      expires_in: body["expires_in"],
      refresh_token: body["refresh_token"],
      scope: body["scope"]
    }

    {:ok, client}
  end

  defp handle_error(response) do
    body = Jason.decode!(response.body)

    error = %ApiError{
      code: response.status_code,
      name: body["error"],
      message: body["error_description"]
    }

    {:error, error}
  end

  defp url_encoded(params) when is_map(params) do
    params
    |> Enum.map(fn {key, value} -> "#{key}=#{value}" end)
    |> Enum.join("&")
  end

  defp headers do
    basic_auth = Application.get_env(:banco_bs2, :basic_auth)

    credentials = Base.encode64("#{basic_auth.user}:#{basic_auth.pass}")

    Map.put(@default_headers, :Authorization, "Basic #{credentials}")
  end
end
