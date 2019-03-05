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
    |> validate_length_of_title
  end

  defp validate_length_of_title(changeset, field \\ :title, options \\ []) do
    validate_change(changeset, field, fn _, title ->
      case String.length(title) < 151 do
        true -> []
        false -> [{field, options[:message] || "Title to long, must be 150 charaters or less"}]
      end
    end)
  end
end
