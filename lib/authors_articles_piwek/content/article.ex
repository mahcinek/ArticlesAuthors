defmodule AAPiwek.Content.Article do
  use Ecto.Schema
  import Ecto.Changeset


  schema "articles" do
    field :body, :string
    field :description, :string
    field :published_at, :naive_datetime
    field :title, :string
    belongs_to :author, AAPiwek.Auth.Author, foreign_key: :author_id

    timestamps()
  end

  @doc false
  def changeset(article, attrs) do
    article
    |> cast(attrs, [:title, :description, :body, :published_at, :author_id])
    |> validate_required([:title, :body, :published_at, :author_id])
  end
end
