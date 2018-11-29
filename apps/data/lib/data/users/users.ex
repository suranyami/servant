defmodule Data.Users do
  @moduledoc """
  Data context for manipulating users.
  """
  alias Data.{Repo, User}

  def get_by_email(email) do
    Repo.get_by(User, email: email)
  end

  def create(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  def create(email, first_name, last_name, password) do
    %{
      email: email,
      first_name: first_name,
      last_name: last_name,
      password: password,
      password_confirmation: password
    }
    |> create()
  end

  def get!(id) when is_integer(id) do
    Repo.get!(User, id)
  end

  def get!(id) when is_binary(id) do
    with {int_id, _} <- Integer.parse(id) do
      get!(int_id)
    else
      :error -> {:error, "id not an integer"}
    end
  end

  def update(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  def delete(%User{} = user) do
    Repo.delete(user)
  end

  def list() do
    Repo.all(User)
  end
end
