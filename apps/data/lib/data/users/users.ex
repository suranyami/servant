defmodule Data.Users do
  @moduledoc """
  Data context for manipulating users.
  """
  alias Data.{Repo, User}
  import Ecto.Query, only: [from: 2]

  def get_by_email(email) do
    Repo.get_by(User, email: email)
  end

  def create(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
    |> user_created()
  end

  def create(first_name, last_name, email, password) do
    %{
      first_name: first_name,
      last_name: last_name,
      email: email,
      password: password
    }
    |> create()
  end

  defp user_created({:ok, user}), do: {:ok, user}

  defp user_created({:error, %Ecto.Changeset{errors: [email: {_, [constraint: :unique, constraint_name: _]}]}}) do
    {:error, "Email not unique"}
  end

  defp user_created({:error, %Ecto.Changeset{errors: errors}}), do: {:error, errors}

  def get(id) when is_integer(id) do
    Repo.get(User, id)
  end

  def get(id) when is_binary(id) do
    with {int_id, _} <- Integer.parse(id) do
      get(int_id)
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

  def list(
        %{
          page: _page,
          page_size: _page_size,
          sort_by: sort_by,
          sort_order: sort_order
        } = params
      ) do
    order_def =
      if sort_order == "desc" do
        [desc: String.to_atom(sort_by)]
      else
        [asc: String.to_atom(sort_by)]
      end

    query = from(u in User, order_by: ^order_def)
    Repo.paginate(query, params)
  end

  def list do
    Repo.all(User)
  end
end
