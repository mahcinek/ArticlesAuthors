defmodule AAPiwekWeb.ArticleControllerTest do
  use AAPiwekWeb.ConnCase

  alias AAPiwek.Content
  alias AAPiwek.Auth
  import AAPiwek.Factory

  @create_attrs %{
    body: "some body",
    description: "some description",
    published_at: "2010-04-17T14:00:00Z",
    title: "some title"
  }
  @invalid_attrs %{body: nil, description: nil, published_at: nil, title: nil}

  def fixture(:article) do
    {:ok, article} = Content.create_article(@create_attrs)
    article
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    setup [:setup_auth]
    test "lists all articles", %{conn: conn} do
      conn = get(conn, Routes.article_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create article" do
    setup [:setup_auth]

    test "renders article when data is valid", %{conn: conn} do
      conn = post(conn, Routes.article_path(conn, :create), article: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.article_path(conn, :create), article: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete article" do
    setup [:create_article_auth]

    test "deletes chosen article", %{conn: conn, article: article} do
      conn = delete(conn, Routes.article_path(conn, :delete, article))
      assert response(conn, 204)

    end
  end

  defp create_article(_) do
    article = insert(:article)
    {:ok, article: article}
  end

  defp create_article_auth %{conn: conn} do
    article = insert(:article)
    author = article.author
    {:ok, jwt} = Auth.create_token(author)
    conn = conn
           |> put_req_header("accept", "application/json")
           |> put_req_header("authorization", "Bearer #{jwt}")
    {:ok, conn: conn, author: author, token: jwt, article: article}
  end

  defp setup_auth %{conn: conn} do
    author = insert(:author)
    {:ok, jwt} = Auth.create_token(author)
    conn = conn
           |> put_req_header("accept", "application/json")
           |> put_req_header("authorization", "Bearer #{jwt}")
    {:ok, conn: conn, author: author, token: jwt}
  end
end
