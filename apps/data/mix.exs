defmodule Data.MixProject do
  use Mix.Project

  def project do
    [
      app: :data,
      version: "0.1.0",
      build_path: "../../_build",
      config_path: "../../config/config.exs",
      deps_path: "../../deps",
      lockfile: "../../mix.lock",
      elixir: "~> 1.7",
      build_embedded: Mix.env() in [:prod, :staging],
      start_permanent: Mix.env() in [:prod, :staging],
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:appsignal, "~> 1.0"},
      {:bcrypt_elixir, "~> 1.0"},
      {:comeonin, "~> 4.0"},
      {:csv, "~> 2.1"},
      {:ecto, "~> 2.1"},
      {:ex_machina, "~> 2.2"},
      {:faker, "~> 0.10"},
      {:guardian, "~> 1.0"},
      {:inflex, "~> 1.10"},
      {:postgrex, ">= 0.0.0"},
      {:scrivener_ecto, "~> 1.0"},
      {:timex, "~> 3.3"}
    ]
  end
end
