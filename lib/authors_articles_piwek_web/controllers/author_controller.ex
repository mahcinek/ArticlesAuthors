defmodule AAPiwekWeb.AuthorController do
  use AAPiwekWeb, :controller

  alias AAPiwek.Auth
  alias AAPiwek.Auth.Author

  action_fallback AAPiwekWeb.FallbackController

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
    author = Guardian.Plug.current_resource(conn)
    render(conn, "show.json", author: author)
  end

  def update(conn, %{"id" => id, "author" => author_params}) do
    author = Guardian.Plug.current_resource(conn)
    with {:ok, %Author{} = author} <- Auth.update_author(author, author_params) do
      render(conn, "show.json", author: author)
    end
  end
end
