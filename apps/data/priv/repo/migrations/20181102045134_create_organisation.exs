defmodule Data.Repo.Migrations.CreateOrganisation do
  use Ecto.Migration

  def change do
    create table(:organisations) do
      add(:code, :string, null: false)
      add(:name, :string, null: false)

      timestamps()
    end

    create(unique_index(:organisations, [:code]))
    create(unique_index(:organisations, [:name]))
  end
end
