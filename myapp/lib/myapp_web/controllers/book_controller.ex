defmodule MyappWeb.BookController do
  use MyappWeb, :controller

  alias Myapp.Documents
  alias Myapp.Documents.Book

  action_fallback MyappWeb.FallbackController

  def index(conn, _params) do
    books = Documents.list_books()
    render(conn, "index.json", books: books)
  end

  def create(conn, %{"book" => book_params}) do
    with {:ok, %Book{} = book} <- Documents.create_book(book_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.book_path(conn, :show, book))
      |> render("show.json", book: book)
    end
  end

  def show(conn, %{"id" => id}) do
    book = Documents.get_book!(id)
    render(conn, "show.json", book: book)
  end

  def update(conn, %{"id" => id, "book" => book_params}) do
    book = Documents.get_book!(id)

    with {:ok, %Book{} = book} <- Documents.update_book(book, book_params) do
      render(conn, "show.json", book: book)
    end
  end

  def delete(conn, %{"id" => id}) do
    book = Documents.get_book!(id)

    with {:ok, %Book{}} <- Documents.delete_book(book) do
      send_resp(conn, :no_content, "")
    end
  end
end
