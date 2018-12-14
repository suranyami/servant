defmodule Web.Resolvers.Users do
  @moduledoc """
    Queries for user.
  """

  alias Data.Users
  alias Web.Session

  def login(_parent, %{email: email, password: password}, _resolution) do
    Session.login(email, password)
  end

  def find(_parent, %{id: id}, _resolution) do
    Users.get!(id)
  end

  def create(_parent, %{email: email, password: password}, _resolution) do
    Users.create(email, password)
  end

  def update(_parent, %{id: id, user: user_params}, _info) do
    id
    |> Data.Users.get!()
    |> Data.Users.update(user_params)
  end

  def list(_parent, _, %{context: %{current_user: _}}) do
    {:ok, Users.list()}
  end

  def list(_parent, _, _) do
    {:error, "Not Authorized"}
  end
end
