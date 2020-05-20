defmodule BancoBs2.Plugins.AuthHeaders do
  @moduledoc """
    Contains shared functions to be used in API modules.
  """

  @doc """
    Generates HTTP headers with including access_token
    from %Client{} entity.

    Returns %{} with necessary headers.
  """

  @spec auth_headers(Client.t(), map) :: map
  def auth_headers(%{token_type: token_type, access_token: access_token}, default_headers \\ %{}) do
    Map.put(
      default_headers,
      :Authorization,
      token_type <> " " <> access_token
    )
  end
end
