defmodule Myapp.Documents do
  @moduledoc """
  The Documents context.
  """

  import Ecto.Query, warn: false
  alias Myapp.Repo

  alias Myapp.Documents.Book

  @doc """
  Returns the list of books.

  ## Examples

      iex> list_books()
      [%Book{}, ...]

  """
  def list_books(args) do
    query = from(Book)

    Enum.reduce(args, query, fn
      {:limit, limit}, query -> from query, limit: ^limit

      true, query -> query
    end)
    |> Repo.all(Book)
  end

  @doc """
  Gets a single book.

  Raises `Ecto.NoResultsError` if the Book does not exist.

  ## Examples

      iex> get_book!(123)
      %Book{}

      iex> get_book!(456)
      ** (Ecto.NoResultsError)

  """
  def get_book!(id), do: Repo.get!(Book, id)

  @doc """
  Creates a book.

  ## Examples

      iex> create_book(%{field: value})
      {:ok, %Book{}}

      iex> create_book(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_book(attrs \\ %{}) do
    %Book{}
    |> Book.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a book.

  ## Examples

      iex> update_book(book, %{field: new_value})
      {:ok, %Book{}}

      iex> update_book(book, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_book(%Book{} = book, attrs) do
    book
    |> Book.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a book.

  ## Examples

      iex> delete_book(book)
      {:ok, %Book{}}

      iex> delete_book(book)
      {:error, %Ecto.Changeset{}}

  """
  def delete_book(%Book{} = book) do
    Repo.delete(book)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking book changes.

  ## Examples

      iex> change_book(book)
      %Ecto.Changeset{data: %Book{}}

  """
  def change_book(%Book{} = book, attrs \\ %{}) do
    Book.changeset(book, attrs)
  end

  alias Myapp.Documents.Verse

  @doc """
  Returns the list of verses.

  ## Examples

      iex> list_verses()
      [%Verse{}, ...]

  """
  def list_verses do
    Repo.all(Verse)
  end

  @doc """
  Gets a single verse.

  Raises `Ecto.NoResultsError` if the Verse does not exist.

  ## Examples

      iex> get_verse!(123)
      %Verse{}

      iex> get_verse!(456)
      ** (Ecto.NoResultsError)

  """
  def get_verse!(id), do: Repo.get!(Verse, id)

  @doc """
  Creates a verse.

  ## Examples

      iex> create_verse(%{field: value})
      {:ok, %Verse{}}

      iex> create_verse(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_verse(attrs \\ %{}) do
    %Verse{}
    |> Verse.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a verse.

  ## Examples

      iex> update_verse(verse, %{field: new_value})
      {:ok, %Verse{}}

      iex> update_verse(verse, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_verse(%Verse{} = verse, attrs) do
    verse
    |> Verse.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a verse.

  ## Examples

      iex> delete_verse(verse)
      {:ok, %Verse{}}

      iex> delete_verse(verse)
      {:error, %Ecto.Changeset{}}

  """
  def delete_verse(%Verse{} = verse) do
    Repo.delete(verse)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking verse changes.

  ## Examples

      iex> change_verse(verse)
      %Ecto.Changeset{data: %Verse{}}

  """
  def change_verse(%Verse{} = verse, attrs \\ %{}) do
    Verse.changeset(verse, attrs)
  end
end
