defmodule Web.Resolvers.UserResolver do
  @moduledoc """
    Queries for user.
  """

  alias Data.Users
  alias Web.Session

  def login(_parent, %{email: email, password: password}, _resolution) do
    Session.login(email, password)
  end

  def find(_parent, %{id: id}, _resolution) do
    Users.get(id)
  end

  def create(_parent,
    %{
      first_name: first_name,
      last_name: last_name,
      email: email,
      password: password
    },
    _resolution) do

    res = Users.create(first_name, last_name, email, password)

    with {:ok, _user} <- res
    do
      Session.login(email, password)
    else
      # TODO: Need to parse the errors, because they have tuples: JSON won't like it.
      {:error, []} -> {:error, "Lots of reasons"}
      {:error, reason} -> {:error, reason}
    end
  end

  def update(_parent, %{id: id, user: user_params}, _info) do
    id
    |> Users.get()
    |> Users.update(user_params)
  end

  def list(_parent, %{
    page: _,
    page_size: _,
    sort_by: _,
    sort_order: _
  } = params, %{context: %{current_user: _}}) do
    updated =
      params
      |> Map.replace!(:sort_by, underscore(params[:sort_by]))
    {:ok, Users.list(updated)}
  end

  def list(_parent, _, %{context: %{current_user: _}}) do
    {:ok, Users.list()}
  end

  def list(_parent, _, _) do
    {:error, "Not Authorized"}
  end

  defp underscore(str) do
    Macro.underscore(str)
  end
end
