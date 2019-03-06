defmodule AAPiwekWeb.ArticleView do
  use AAPiwekWeb, :view
  alias AAPiwekWeb.ArticleView

  def render("index.json", %{articles: articles}) do
    %{data: render_many(articles, ArticleView, "article.json")}
  end

  def render("show.json", %{article: article}) do
    %{data: render_one(article, ArticleView, "article.json")}
  end

  def render("create.json", %{article: article}) do
    %{data: %{
        id: article.id,
        body: article.body,
        description: article.description,
        published_at: article.published_at,
        title: article.title
    }}
  end

  def render("article.json", %{article: article}) do
    %{  data: %{
          id: article.id,
          body: article.body,
          description: article.description,
          published_at: article.published_at,
          title: article.title,
          author: %{
            id: article.author.id,
            first_name: article.author.first_name,
            last_name: article.author.last_name,
            age: article.author.age
      }}}
  end
end
