defmodule WebWeb.Resolvers.Users do
  @moduledoc """
    Queries for user.
  """
  def find(_parent, %{id: id}, _resolution) do
    Data.Users.get!(id)
  end

  def create(
        _parent,
        %{
          email: email,
          first_name: first_name,
          last_name: last_name
        },
        _resolution
      ) do
    Data.Users.create(email, first_name, last_name, nil)
  end

  def list(_parent, _, _resolution) do
    {:ok, Data.Users.list()}
  end
end
