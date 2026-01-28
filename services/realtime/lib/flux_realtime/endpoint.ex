defmodule FluxRealtime.Endpoint do
  use Phoenix.Endpoint, otp_app: :flux_realtime

  socket "/socket", FluxRealtime.UserSocket,
    websocket: true,
    longpoll: false

  plug Plug.RequestId
  plug Plug.Logger
  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Jason
  plug Plug.MethodOverride
  plug Plug.Head
  plug Plug.Session, store: :cookie, key: "_flux_realtime_key", signing_salt: "dev_salt"
  plug FluxRealtime.Router
end
