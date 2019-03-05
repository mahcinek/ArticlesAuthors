defmodule AAPiwek.Repo.Migrations.CreateAuthors do
  use Ecto.Migration

  def change do
    create table(:authors) do
      add :first_name, :string, null: false
      add :last_name, :string, null: false
      add :age, :integer

      timestamps()
    end

  end
end
