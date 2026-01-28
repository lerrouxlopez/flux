defmodule FluxRealtime.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      {Phoenix.PubSub, name: FluxRealtime.PubSub},
      FluxRealtime.Endpoint
    ]

    opts = [strategy: :one_for_one, name: FluxRealtime.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
