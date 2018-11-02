use Mix.Config

# Configure your database
config :data, Data.Repo,
  adapter: Ecto.Adapters.Postgres,
  pool: Ecto.Adapters.SQL.Sandbox,
  url:
    System.get_env("DATABASE_URL") || "postgres://postgres:postgres@localhost:5432/servant_test",
  timeout: String.to_integer(System.get_env("QUERY_TIMEOUT") || "60000"),
  ownership_timeout: 240_000
