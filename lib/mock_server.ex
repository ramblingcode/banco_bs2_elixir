defmodule BancoBs2.MockServer do
  @moduledoc false

  use Plug.Router

  plug(Plug.Parsers,
    parsers: [:urlencoded, :json],
    pass: ["text/*"],
    json_decoder: Jason
  )

  plug(:match)
  plug(:dispatch)

  @auth_success_body %{
    access_token: "valid_access_token",
    token_type: "Bearer",
    expires_in: 420,
    refresh_token: "valid_refresh_token",
    scope: "forintegration"
  }

  @auth_error_body %{
    error: "invalid_request",
    error_description: "The resource owner could not be authenticated."
  }

  post "/auth/oauth/v2/token" do
    case conn.body_params do
      %{"scope" => "success"} ->
        success(conn, 200, @auth_success_body)

      %{"scope" => "failure"} ->
        failure(conn, 401, @auth_error_body)
    end
  end

  defp success(conn, code, body) do
    conn
    |> Plug.Conn.send_resp(code, Jason.encode!(body))
  end

  defp failure(conn, code, body) do
    conn
    |> Plug.Conn.send_resp(code, Jason.encode!(body))
  end
end
