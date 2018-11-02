defmodule Data.Repo.Migrations.CreateEvents do
  use Ecto.Migration

  def change do
    create table(:events) do
      add(:name, :string, null: false)
      add(:description, :text)
      add(:starts_at, :utc_datetime, index: true)
      add(:ends_at, :utc_datetime, index: true)

      timestamps()
    end
  end
end
