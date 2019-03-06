defmodule AAPiwekWeb.ArticleController do
  use AAPiwekWeb, :controller
  require Logger

  alias AAPiwek.Content
  alias AAPiwek.Auth
  alias AAPiwek.Content.Article

  action_fallback AAPiwekWeb.FallbackController

  def index(conn, _params) do
    articles = Content.list_articles_ass()
    render(conn, "index.json", articles: articles)
  end

  def create(conn, %{"article" => article_params}) do
    author = Guardian.Plug.current_resource(conn)
    with {:ok, %Article{} = article} <-
          Content.create_article(Map.put(article_params, "author_id", author.id)) do
      conn
      |> put_status(:created)
      |> render("create.json", article: article)
    end
  end

  def delete(conn, %{"id" => id}) do
    with {:ok, article: %Article{} = article} <- get_art(Guardian.Plug.current_resource(conn), id) do
      with {:ok, %Article{}} <- Content.delete_article(article) do
        send_resp(conn, :no_content, "")
      end
    end
  end

  defp get_art(author, article_id) do
    case Auth.get_article(author, article_id) do
      {:error,_} ->
        {:error, :forbidden}
      {:ok, article} ->
        {:ok, article}
    end
  end
end
