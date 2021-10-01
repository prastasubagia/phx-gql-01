defmodule Myapp.DocumentsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Myapp.Documents` context.
  """

  @doc """
  Generate a book.
  """
  def book_fixture(attrs \\ %{}) do
    {:ok, book} =
      attrs
      |> Enum.into(%{
        name: "some name",
        position: 42
      })
      |> Myapp.Documents.create_book()

    book
  end

  @doc """
  Generate a verse.
  """
  def verse_fixture(attrs \\ %{}) do
    {:ok, verse} =
      attrs
      |> Enum.into(%{
        body: "some body",
        chapter: 42,
        number: 42
      })
      |> Myapp.Documents.create_verse()

    verse
  end
end
