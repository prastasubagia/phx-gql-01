defmodule Myapp.DocumentsTest do
  use Myapp.DataCase

  alias Myapp.Documents

  describe "books" do
    alias Myapp.Documents.Book

    import Myapp.DocumentsFixtures

    @invalid_attrs %{name: nil, position: nil}

    test "list_books/0 returns all books" do
      book = book_fixture()
      assert Documents.list_books() == [book]
    end

    test "get_book!/1 returns the book with given id" do
      book = book_fixture()
      assert Documents.get_book!(book.id) == book
    end

    test "create_book/1 with valid data creates a book" do
      valid_attrs = %{name: "some name", position: 42}

      assert {:ok, %Book{} = book} = Documents.create_book(valid_attrs)
      assert book.name == "some name"
      assert book.position == 42
    end

    test "create_book/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Documents.create_book(@invalid_attrs)
    end

    test "update_book/2 with valid data updates the book" do
      book = book_fixture()
      update_attrs = %{name: "some updated name", position: 43}

      assert {:ok, %Book{} = book} = Documents.update_book(book, update_attrs)
      assert book.name == "some updated name"
      assert book.position == 43
    end

    test "update_book/2 with invalid data returns error changeset" do
      book = book_fixture()
      assert {:error, %Ecto.Changeset{}} = Documents.update_book(book, @invalid_attrs)
      assert book == Documents.get_book!(book.id)
    end

    test "delete_book/1 deletes the book" do
      book = book_fixture()
      assert {:ok, %Book{}} = Documents.delete_book(book)
      assert_raise Ecto.NoResultsError, fn -> Documents.get_book!(book.id) end
    end

    test "change_book/1 returns a book changeset" do
      book = book_fixture()
      assert %Ecto.Changeset{} = Documents.change_book(book)
    end
  end

  describe "verses" do
    alias Myapp.Documents.Verse

    import Myapp.DocumentsFixtures

    @invalid_attrs %{body: nil, chapter: nil, number: nil}

    test "list_verses/0 returns all verses" do
      verse = verse_fixture()
      assert Documents.list_verses() == [verse]
    end

    test "get_verse!/1 returns the verse with given id" do
      verse = verse_fixture()
      assert Documents.get_verse!(verse.id) == verse
    end

    test "create_verse/1 with valid data creates a verse" do
      valid_attrs = %{body: "some body", chapter: 42, number: 42}

      assert {:ok, %Verse{} = verse} = Documents.create_verse(valid_attrs)
      assert verse.body == "some body"
      assert verse.chapter == 42
      assert verse.number == 42
    end

    test "create_verse/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Documents.create_verse(@invalid_attrs)
    end

    test "update_verse/2 with valid data updates the verse" do
      verse = verse_fixture()
      update_attrs = %{body: "some updated body", chapter: 43, number: 43}

      assert {:ok, %Verse{} = verse} = Documents.update_verse(verse, update_attrs)
      assert verse.body == "some updated body"
      assert verse.chapter == 43
      assert verse.number == 43
    end

    test "update_verse/2 with invalid data returns error changeset" do
      verse = verse_fixture()
      assert {:error, %Ecto.Changeset{}} = Documents.update_verse(verse, @invalid_attrs)
      assert verse == Documents.get_verse!(verse.id)
    end

    test "delete_verse/1 deletes the verse" do
      verse = verse_fixture()
      assert {:ok, %Verse{}} = Documents.delete_verse(verse)
      assert_raise Ecto.NoResultsError, fn -> Documents.get_verse!(verse.id) end
    end

    test "change_verse/1 returns a verse changeset" do
      verse = verse_fixture()
      assert %Ecto.Changeset{} = Documents.change_verse(verse)
    end
  end
end
