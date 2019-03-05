defmodule AAPiwek.Factory do
  # with Ecto
  use ExMachina.Ecto, repo: AAPiwek.Repo

  def author_factory do
    %AAPiwek.Auth.Author{
      age: 42,
      last_name: "some  last_name",
      first_name: "some first_name"
    }
  end

  def article_factory do
    %AAPiwek.Content.Article{
      body: "some body",
      description: "some description",
      published_at: ~N[2010-04-17 14:00:00],
      title: "some title",
      author: build(:author),
    }
  end
end
