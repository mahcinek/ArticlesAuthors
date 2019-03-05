defmodule AAPiwekWeb.AuthorView do
  use AAPiwekWeb, :view
  alias AAPiwekWeb.AuthorView
  alias AAPiwekWeb.ChangesetView

  def render("index.json", %{authors: authors}) do
    %{data: render_many(authors, AuthorView, "author.json")}
  end

  def render("show.json", %{author: author}) do
    %{data: render_one(author, AuthorView, "author.json")}
  end

  def render("create.json", %{author: author, token: token}) do
    %{id: author.id,
      first_name: author.first_name,
      last_name: author.last_name,
      age: author.age,
      token: token}
  end

  def render("author.json", %{author: author}) do
    %{id: author.id,
      first_name: author.first_name,
      last_name: author.last_name,
      age: author.age}
  end

  def render("error.json", changeset) do
    ChangesetView.render("error.json", changeset)
  end

end
