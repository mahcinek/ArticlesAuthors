defmodule AAPiwek.AuthTest do
  use AAPiwek.DataCase

  alias AAPiwek.Auth

  describe "authors" do
    alias AAPiwek.Auth.Author

    @valid_attrs %{age: 42, last_name: "some  last_name", first_name: "some first_name"}
    @update_attrs %{age: 43, last_name: "some updated  last_name", first_name: "some updated first_name"}
    @invalid_attrs %{age: nil, last_name: nil, first_name: nil}

    def author_fixture(attrs \\ %{}) do
      {:ok, author} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Auth.create_author()

      author
    end

    test "list_authors/0 returns all authors" do
      author = author_fixture()
      assert Auth.list_authors() == [author]
    end

    test "get_author!/1 returns the author with given id" do
      author = author_fixture()
      assert Auth.get_author!(author.id) == author
    end

    test "create_author/1 with valid data creates a author" do
      assert author = author_fixture()
      assert author.age == 42
      assert author.last_name == "some  last_name"
      assert author.first_name == "some first_name"
    end

    test "create_author/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Auth.create_author(@invalid_attrs)
    end

    test "update_author/2 with valid data updates the author" do
      author = author_fixture()
      assert {:ok, %Author{} = author} = Auth.update_author(author, @update_attrs)
      assert author.age == 43
      assert author.last_name == "some updated  last_name"
      assert author.first_name == "some updated first_name"
    end

    test "update_author/2 with invalid data returns error changeset" do
      author = author_fixture()
      assert {:error, %Ecto.Changeset{}} = Auth.update_author(author, @invalid_attrs)
      assert author == Auth.get_author!(author.id)
    end

    test "delete_author/1 deletes the author" do
      author = author_fixture()
      assert {:ok, %Author{}} = Auth.delete_author(author)
      assert_raise Ecto.NoResultsError, fn -> Auth.get_author!(author.id) end
    end

    test "change_author/1 returns a author changeset" do
      author = author_fixture()
      assert %Ecto.Changeset{} = Auth.change_author(author)
    end
  end
end
