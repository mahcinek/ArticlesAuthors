defmodule AAPiwekWeb.ArticleController do
  use AAPiwekWeb, :controller

  alias AAPiwek.Content
  alias AAPiwek.Content.Article

  action_fallback AAPiwekWeb.FallbackController

  def index(conn, _params) do
    articles = Content.list_articles()
    render(conn, "index.json", articles: articles)
  end

  def create(conn, %{"article" => article_params}) do
    with {:ok, %Article{} = article} <- Content.create_article(article_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.article_path(conn, :show, article))
      |> render("show.json", article: article)
    end
  end

  def show(conn, %{"id" => id}) do
    article = Content.get_article!(id)
    render(conn, "show.json", article: article)
  end

  def update(conn, %{"id" => id, "article" => article_params}) do
    article = Content.get_article!(id)

    with {:ok, %Article{} = article} <- Content.update_article(article, article_params) do
      render(conn, "show.json", article: article)
    end
  end

  def delete(conn, %{"id" => id}) do
    article = Content.get_article!(id)

    with {:ok, %Article{}} <- Content.delete_article(article) do
      send_resp(conn, :no_content, "")
    end
  end
end
