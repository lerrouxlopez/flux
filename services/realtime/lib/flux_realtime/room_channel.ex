defmodule FluxRealtime.RoomChannel do
  use Phoenix.Channel

  @impl true
  def join("room:" <> _room_id, _params, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_in("ping", payload, socket) do
    {:reply, {:ok, payload}, socket}
  end
end
