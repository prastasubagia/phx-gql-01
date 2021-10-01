defmodule Myapp.GraphQL.Types.Index do
  use Absinthe.Schema.Notation

  alias Myapp.GraphQL.Types

  import_types(Types.Book)
  import_types(Types.Verse)
end
