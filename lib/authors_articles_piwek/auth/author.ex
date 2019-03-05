defmodule AAPiwek.Auth.Author do
  use Ecto.Schema
  import Ecto.Changeset


  schema "authors" do
    field :age, :integer
    field :last_name, :string
    field :first_name, :string

    timestamps()
  end

  @doc false
  def changeset(author, attrs) do
    author
    |> cast(attrs, [:first_name, :last_name, :age])
    |> validate_required([:first_name, :last_name, :age])
    |> validate_age_size
  end

  defp validate_age_size(changeset, field \\ :age, options \\ []) do
    validate_change(changeset, field, fn _, age ->
      case age > 13 do
        true -> []
        false -> [{field, options[:message] || "Age must be greater than 13"}]
      end
    end)
  end
end
