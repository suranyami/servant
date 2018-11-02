defmodule Data.Repo.Migrations.CreateVenues do
  use Ecto.Migration

  def change do
    create table(:venues) do
      add(:code, :string, null: false)
      add(:name, :string, null: false)
      add(:description, :text)

      timestamps()
    end

    create(unique_index(:venues, [:code]))
    create(unique_index(:venues, [:name]))
  end
end
