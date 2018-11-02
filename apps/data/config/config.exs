use Mix.Config

config :data, ecto_repos: [Data.Repo]
config :data, Data.Repo, migration_timestamps: [type: :utc_datetime]

import_config "#{Mix.env()}.exs"
