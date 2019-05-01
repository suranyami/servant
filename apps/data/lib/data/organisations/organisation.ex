defmodule Data.Organisation do
  use Ecto.Schema
  import Ecto.Changeset


  schema "organisations" do
    field :code, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(organisation, attrs) do
    organisation
    |> cast(attrs, [:code, :name])
    |> validate_required([:code, :name])
  end
end
