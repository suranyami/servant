defmodule Data.Application do
  @moduledoc """
  The Data Application Service.

  The data system business domain lives in this application.

  Exposes API to clients such as the `DataWeb` application
  for use in channels, controllers, and elsewhere.
  """
  use Application

  def start(_type, _args) do
    children = [Data.Repo]
    Supervisor.start_link(children, strategy: :one_for_one, name: Data.Supervisor)
  end
end
