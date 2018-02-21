defmodule TestEcto.Repo.Migrations.AddUserAndOrder do
  use Ecto.Migration

  def change do

    create table(:users) do
      add :name, :string
    end

    create table(:orders) do
      add :amount, :integer
      add :user_id, references(:users)
    end

  end
end
