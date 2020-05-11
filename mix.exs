defmodule BancoBs2.MixProject do
  use Mix.Project

  def project do
    [
      app: :banco_bs2,
      version: "0.1.0",
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {BancoBs2.Application, [env: Mix.env()]},
      applications: applications(:test)
    ]
  end

  defp applications(:test), do: applications(:default) ++ [:cowboy, :plug]
  defp applications(_), do: [:httpoison]

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:credo, "~> 1.4", only: [:dev, :test], runtime: false},
      {:httpoison, "~> 1.6"},
      {:plug_cowboy, "~> 2.0"}
    ]
  end
end
