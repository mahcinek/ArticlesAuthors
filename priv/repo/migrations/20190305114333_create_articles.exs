defmodule AAPiwek.Repo.Migrations.CreateArticles do
  use Ecto.Migration

  def change do
    create table(:articles) do
      add :title, :string
      add :description, :text
      add :body, :text
      add :published_at, :utc_datetime
      add :author_id, references(:authors, on_delete: :nothing)

      timestamps()
    end

  end
end
