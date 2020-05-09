defmodule BancoBs2.Application do
  @moduledoc false
  alias BancoBs2.MockServer

  @port 8081
  @scheme :http

  def start(_type, args) do
    children =
      case args do
        [env: :prod] -> []
        [env: :test] -> [{Plug.Cowboy, scheme: @scheme, plug: MockServer, options: [port: @port]}]
        [env: :dev] -> []
        [_] -> []
      end

    opts = [strategy: :one_for_one, name: BancoBs2.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
