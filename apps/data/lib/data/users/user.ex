defmodule Data.User do
  @moduledoc """
  User schema definition and changeset rules.
  """
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field(:email, :string)
    field(:encrypted_password, :string)
    field(:password, :string, virtual: true)
    field(:password_confirmation, :string, virtual: true)

    field(:first_name, :string)
    field(:last_name, :string)

    timestamps()
  end

  @required ~w(email password password_confirmation)a
  @optional ~w(first_name last_name)a

  def changeset(%Data.User{} = user, params \\ :empty) do
    user
    |> change()
    |> cast(params, @required ++ @optional)
    |> validate_format(:email, ~r/@/)
    |> validate_length(:password, min: 8)
    |> validate_confirmation(:password)
    |> unique_constraint(:email)
    |> put_password_hash()
  end

  defp put_password_hash(%Ecto.Changeset{valid?: true, changes: %{password: pass}} = changeset) do
    put_change(changeset, :encrypted_password, Bcrypt.hash_pwd_salt(pass))
  end

  defp put_password_hash(changeset), do: changeset
end
