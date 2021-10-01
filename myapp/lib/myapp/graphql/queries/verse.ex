defmodule Myapp.GraphQL.Queries.Verse do
  use Absinthe.Schema.Notation

  object :verse_queries do
    field :id, non_null(:id)
    field :chapter, non_null(:string)
    field :number, non_null(:integer)
    field :body, non_null(:string)

    field :book, :book
  end
end
