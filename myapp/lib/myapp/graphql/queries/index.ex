defmodule Myapp.GraphQL.Queries.Index do
  use Absinthe.Schema.Notation

  alias Myapp.GraphQL.Queries

  import_types(Queries.Book)
  import_types(Queries.Verse)
end
