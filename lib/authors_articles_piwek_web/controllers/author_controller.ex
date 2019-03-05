defmodule AAPiwekWeb.AuthorController do
  use AAPiwekWeb, :controller

  alias AAPiwek.Auth
  alias AAPiwek.Auth.Author

  action_fallback AAPiwekWeb.FallbackController

  def index(conn, _params) do
    authors = Auth.list_authors()
    render(conn, "index.json", authors: authors)
  end

  def create(conn, %{"author" => author_params}) do
    with {:ok, %Author{} = author} <- Auth.create_author(author_params) do
      case Auth.create_token(author) do
        {:ok, token} ->
          conn
          |> put_status(:created)
          |> put_resp_header("location", Routes.author_path(conn, :show, author))
          |> render("create.json", author: author, token: token)
      end

    end
  end

  def show(conn, %{"id" => id}) do
    author = Auth.get_author!(id)
    render(conn, "show.json", author: author)
  end

  def update(conn, %{"id" => id, "author" => author_params}) do
    author = Auth.get_author!(id)

    with {:ok, %Author{} = author} <- Auth.update_author(author, author_params) do
      render(conn, "show.json", author: author)
    end
  end

  def delete(conn, %{"id" => id}) do
    author = Auth.get_author!(id)

    with {:ok, %Author{}} <- Auth.delete_author(author) do
      send_resp(conn, :no_content, "")
    end
  end
end
