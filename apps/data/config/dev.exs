use Mix.Config

# Configure your database
config :data, Data.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "servant_dev",
  hostname: "localhost",
  pool_size: 10,
  timeout: String.to_integer(System.get_env("QUERY_TIMEOUT") || "60000"),
  ownership_timeout: 240_000
