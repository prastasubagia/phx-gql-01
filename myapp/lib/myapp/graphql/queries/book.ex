defmodule Myapp.GraphQL.Queries.Book do
  use Absinthe.Schema.Notation

  alias Myapp.GraphQL.Resolver

  object :book_queries do
    field :books, list_of(:book) do
      arg(:limit, :integer)

      resolve(&Resolver.Book.list_books/2)
    end

    field :book, :book do
      arg(:id, non_null(:integer))

      resolve(&Resolver.Book.get_book/2)
    end
  end
end
