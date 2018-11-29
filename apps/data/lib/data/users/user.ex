defmodule Data.User do
  use Ecto.Schema
  import Ecto.Changeset
  import Comeonin.Bcrypt, only: [hashpwsalt: 1]

  schema "users" do
    field(:email, :string)
    field(:encrypted_password, :string)
    field(:password, :string, virtual: true)
    field(:password_confirmation, :string, virtual: true)

    field(:first_name, :string)
    field(:last_name, :string)

    timestamps()
  end

  @required ~w(email password password_confirmation)
  # @optional ~w(first_name last_name)

  def changeset(%Data.User{} = user, params \\ :empty) do
    user
    |> Ecto.Changeset.change()
    |> cast(params, @required)
    |> validate_format(:email, ~r/@/)
    |> validate_length(:password, min: 8)
    |> validate_confirmation(:password)
    |> unique_constraint(:email)
    |> put_password_hash()
  end

  defp put_password_hash(%Ecto.Changeset{valid?: true, changes: %{password: pass}} = changeset) do
    put_change(changeset, :encrypted_password, hashpwsalt(pass))
  end

  defp put_password_hash(changeset), do: changeset
end
