defmodule Web.Resolvers.Users do
  @moduledoc """
    Queries for user.
  """

  alias Data.Users

  def find(_parent, %{id: id}, _resolution) do
    Users.get!(id)
  end

  def create(_parent, %{email: email, first_name: first_name, last_name: last_name}, _resolution) do
    Users.create(email, first_name, last_name, nil)
  end

  def list(_parent, _, _resolution) do
    {:ok, Users.list()}
  end
end
