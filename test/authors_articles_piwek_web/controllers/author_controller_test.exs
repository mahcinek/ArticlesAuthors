defmodule AAPiwekWeb.AuthorControllerTest do
  use AAPiwekWeb.ConnCase

  alias AAPiwek.Auth
  alias AAPiwek.Auth.Author

  @create_attrs %{
    age: 42,
    first_name: "some first_name",
    last_name: "some last_name"
  }
  @update_attrs %{
    age: 43,
    first_name: "some updated first_name",
    last_name: "some updated last_name"
  }
  @invalid_attrs %{age: nil, first_name: nil, last_name: nil}

  def fixture(:author) do
    {:ok, author} = Auth.create_author(@create_attrs)
    author
  end

  describe "create author" do
    test "renders author when data is valid", %{conn: conn} do
      conn = post(conn, Routes.author_path(conn, :create), author: @create_attrs)
             |> doc(description: "Create Author", operation_id: "create_author")
      assert %{
               "id" => id,
               "age" => 42,
               "first_name" => "some first_name",
               "last_name" => "some last_name",
               "token" => token
             } = json_response(conn, 201)
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.author_path(conn, :create), author: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "show author" do

  setup [:setup_auth]

    test "renders author when data is valid", %{conn: conn, author: %Author{id: id}} do
      conn = get(conn, Routes.author_path(conn, :show, id))
             |> doc(description: "Show author", operation_id: "show_author")
      assert %{
               "id" => id,
               "age" => 42,
               "first_name" => "some first_name",
               "last_name" => "some last_name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.author_path(conn, :create), author: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update author" do

  setup [:setup_auth]

    test "renders author when data is valid", %{conn: conn, author: %Author{id: id} = _author} do
      conn = put(conn, Routes.author_path(conn, :update), author: @update_attrs)
             |> doc(description: "Update author", operation_id: "update_author")
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.author_path(conn, :show, id))

      assert %{
               "id" => id,
               "age" => 43,
               "first_name" => "some updated first_name",
               "last_name" => "some updated last_name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, author: _author} do
      conn = put(conn, Routes.author_path(conn, :update), author: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  defp setup_auth %{conn: conn} do
    author = fixture(:author)
    {:ok, jwt} = Auth.create_token(author)
    conn = conn
           |> put_req_header("accept", "application/json")
           |> put_req_header("authorization", "Bearer #{jwt}")
    {:ok, conn: conn, author: author, token: jwt}
  end

end
