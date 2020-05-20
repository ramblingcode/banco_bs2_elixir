defmodule BancoBs2.Apis.Collection.Boletos do
  @moduledoc """
    Module to interact with Collection API.
  """

  @base_url Application.get_env(:banco_bs2, :base_url)
  @base_endpoint "/pj/forintegration/cobranca/v1/boletos"
  @default_headers %{"Content-type": "application/json"}

  alias BancoBs2.Entities.Client
  alias BancoBs2.ApiError
  alias BancoBs2.Entities.Boleto
  alias HTTPoison.Response
  alias HTTPoison.Error

  import BancoBs2.Plugins.AuthHeaders

  @doc """
    Creates a Boleto. See available parameters to pass
    [here](https://devs.bs2.com/manual/cobranca/#incluir-boleto-de-cobran%C3%A7a)

    If succesful, returns {:ok, %Boleto{}}, else {:error, %ApiError{}}.
  """

  @spec create(Client.t(), map) :: {atom, Boleto.t() | ApiError.t()}
  def create(client, create_params) do
    case HTTPoison.post(
           "#{@base_url}#{@base_endpoint}/simplificado",
           Jason.encode!(create_params),
           auth_headers(client, @default_headers)
         ) do
      {:ok, %Response{status_code: 200, body: body}} ->
        Jason.decode!(body)

      {:ok, response} ->
        handle_error(response)

      {:error, %Error{reason: reason}} ->
        {:error, %ApiError{message: "Connection error occured: #{reason}"}}
    end
  end

  defp handle_error(response) do
    "came here"
  end
end
