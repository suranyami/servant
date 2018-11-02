defmodule Data.Users do
  alias Data.{Repo, User}

  def create(email, first_name, last_name, password) do
    params = %{
      email: email,
      first_name: first_name,
      last_name: last_name,
      encyrpted_password: password
    }

    %User{}
    |> Ecto.Changeset.change(params)
    |> Repo.insert()
  end

  def find(id) when is_integer(id) do
    Repo.get(User, id)
  end

  def find(id) when is_binary(id) do
    with {int_id, _} <- Integer.parse(id) do
      find(int_id)
    else
      :error -> {:error, "id not an integer"}
    end
  end

  def list() do
    Repo.all(User)
  end
end
