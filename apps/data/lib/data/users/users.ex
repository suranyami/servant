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
end
