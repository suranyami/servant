import Config

config :data, ecto_repos: [Data.Repo]
config :data, Data.Repo, migration_timestamps: [type: :utc_datetime]

# General application configuration
config :web,
  namespace: Web

# Configures the endpoint
config :web, Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: System.get_env("SECRET_KEY"),
  render_errors: [view: Web.ErrorView, accepts: ~w(html json)],
  pubsub_server: Web.PubSub

config :web, Web.Guardian,
  issuer: "klub",
  secret_key: System.get_env("SECRET_KEY")

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
