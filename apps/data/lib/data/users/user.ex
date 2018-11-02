defmodule Data.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field(:email, :string)
    field(:encrypted_password, :string)
    field(:first_name, :string)
    field(:last_name, :string)

    timestamps()
  end

  @required ~w(email)
  @optional ~w(first_name last_name encrypted_password)

  def changeset(user, params \\ :empty) do
    user
    |> Ecto.Changeset.change()
    |> cast(params, @required, @optional)
    |> validate_format(:email, ~r/@/)
    |> unique_constraint(:email)
  end
end
