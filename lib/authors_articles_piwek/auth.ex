defmodule AAPiwek.Auth do
  @moduledoc """
  The Auth context.
  """

  import Ecto.Query, warn: false
  alias AAPiwek.Repo

  alias AAPiwek.Auth.Author
  alias AAPiwek.Content.Article

  @doc """
  Returns the list of authors.

  ## Examples

      iex> list_authors()
      [%Author{}, ...]

  """
  def list_authors do
    Repo.all(Author)
  end

  @doc """
  Gets a single author.

  Raises `Ecto.NoResultsError` if the Author does not exist.

  ## Examples

      iex> get_author!(123)
      %Author{}

      iex> get_author!(456)
      ** (Ecto.NoResultsError)

  """
  def get_author!(id), do: Repo.get!(Author, id)

  @doc """
  Creates a author.

  ## Examples

      iex> create_author(%{field: value})
      {:ok, %Author{}}

      iex> create_author(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_author(attrs \\ %{}) do
    %Author{}
    |> Author.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a author.

  ## Examples

      iex> update_author(author, %{field: new_value})
      {:ok, %Author{}}

      iex> update_author(author, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_author(%Author{} = author, attrs) do
    author
    |> Author.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Author.

  ## Examples

      iex> delete_author(author)
      {:ok, %Author{}}

      iex> delete_author(author)
      {:error, %Ecto.Changeset{}}

  """
  def delete_author(%Author{} = author) do
    Repo.delete(author)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking author changes.

  ## Examples

      iex> change_author(author)
      %Ecto.Changeset{source: %Author{}}

  """
  def change_author(%Author{} = author) do
    Author.changeset(author, %{})
  end

  @doc """
  Returns a token for given author.

  ## Examples

      iex> create_token(author)
      "asddsadsasazxc"

  """
  def create_token(%Author{} = author) do
    case AAPiwek.Guardian.encode_and_sign(author, %{}, ttl: {1, :hour}) do
      {:ok, token, claims} ->
        {:ok, token}
      {_} ->
        {:error, ""}
    end
  end

  @doc """
  Returns author and status for given token.

  ## Examples

      iex> create_token(author)
      "asddsadsasazxc"

  """
  def authenticate(token) do

    case AAPiwek.Guardian.resource_from_token(token) do
      {:ok, resource, claims} ->
        {:ok, resource}
      {_} ->
        {:error, false}
    end
  end

  @doc """
  Refresh given token.

  ## Examples

      iex> create_token(author)
      "asddsadsasazxc"

  """
  def refresh(token) do
    case AAPiwek.Guardian.refresh(token) do
      {:ok, _old_stuff, {new_token, new_claims}} ->
        {:ok, new_token}
      {_} ->
        {:error, ""}
    end
  end

  @doc """
  Find articles belonging to Author.

  ## Examples

      iex> get_articles(author)

  """
  def get_articles(author) do
    a_id = author.id
    query = from a in Article, where: a.author_id == ^a_id
    Repo.all(query)
  end
  @doc """
  Find articles belonging to Author.

  ## Examples

      iex> create_token(author)
      "asddsadsasazxc"

  """
  def get_article(author, article_id) do
    a_id = author.id
    query = from a in Article, where: a.author_id == ^a_id and a.id == ^article_id
    case Repo.one(query) do
      nil ->
        {:error, :not_found}
      article ->
        {:ok, article: article}
    end
  end
end
