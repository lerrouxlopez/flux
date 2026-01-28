defmodule FluxRealtime.MixProject do
  use Mix.Project

  def project do
    [
      app: :flux_realtime,
      version: "0.1.0",
      elixir: "~> 1.15",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      mod: {FluxRealtime.Application, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  defp deps do
    [
      {:phoenix, "~> 1.7"},
      {:phoenix_pubsub, "~> 2.1"},
      {:cowboy, "~> 2.12"},
      {:jason, "~> 1.4"}
    ]
  end
end
