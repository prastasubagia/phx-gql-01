defmodule Myapp.GraphQL.Types.Verse do
  use Absinthe.Schema.Notation

  object :verse do
    field :verses, list_of(:verse)
  end
end
