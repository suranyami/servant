defmodule Web.Mixfile do
  use Mix.Project

  def project do
    [
      app: :web,
      version: "0.0.1",
      build_path: "../../_build",
      config_path: "../../config/config.exs",
      deps_path: "../../deps",
      lockfile: "../../mix.lock",
      elixir: "~> 1.7",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:phoenix, :gettext] ++ Mix.compilers(),
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {Web.Application, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:absinthe, "~> 1.4"},
      {:absinthe_phoenix, "~> 1.4"},
      {:absinthe_plug, "~> 1.4"},
      {:bcrypt_elixir, "~> 1.1"},
      {:comeonin, "~> 4.1"},
      {:corsica, "~> 1.1"},
      {:data, in_umbrella: true},
      {:gettext, "~> 0.11"},
      {:guardian, "~> 1.1"},
      {:jason, "~> 1.0"},
      {:phoenix, "~> 1.4"},
      {:phoenix_html, "~> 2.12"},
      {:phoenix_live_reload, "~> 1.2", only: :dev},
      {:phoenix_pubsub, "~> 1.1"},
      {:plug, "~> 1.7"},
      {:plug_cowboy, "~> 2.0"}
    ]
  end
end
