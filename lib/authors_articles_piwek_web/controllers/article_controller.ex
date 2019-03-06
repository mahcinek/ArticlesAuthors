defmodule AAPiwekWeb.ArticleController do
  use AAPiwekWeb, :controller

  alias AAPiwek.Content
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
    article = Content.get_article!(id)

    with {:ok, %Article{}} <- Content.delete_article(article) do
      send_resp(conn, :no_content, "")
    end
  end
end
