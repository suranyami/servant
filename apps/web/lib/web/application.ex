defmodule Web.Application do
  @moduledoc """
  Sets up supervisors for Web Endpoint and any others needed.
  """
  use Application
  alias Web.Endpoint

  def start(_type, _args) do
    children = [
      Web.Endpoint,
      {Phoenix.PubSub, name: Web.PubSub},
      {Absinthe.Subscription, [Endpoint]}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Web.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    Endpoint.config_change(changed, removed)
    :ok
  end
end
