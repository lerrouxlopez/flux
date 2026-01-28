import Config

config :flux_realtime, FluxRealtime.Endpoint,
  url: [host: "localhost"],
  http: [ip: {127, 0, 0, 1}, port: 4001],
  server: true,
  pubsub_server: FluxRealtime.PubSub,
  secret_key_base: "dev_secret_key_base_change_me"

config :phoenix, :json_library, Jason
