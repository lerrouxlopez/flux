defmodule FluxRealtime.HealthController do
  use Phoenix.Controller, namespace: FluxRealtime

  def index(conn, _params) do
    json(conn, %{status: "ok"})
  end
end
