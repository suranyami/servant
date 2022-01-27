defmodule Data.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add(:email, :string, null: false)
      add(:encrypted_password, :string)
      add(:first_name, :string)
      add(:last_name, :string)

      timestamps()
    end

    create(unique_index(:users, [:email]))
    create(index(:users, [:first_name, :last_name]))
  end
end
