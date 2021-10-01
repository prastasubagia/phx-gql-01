defmodule Myapp.GraphQL.Types.Book do
  use Absinthe.Schema.Notation

  import Absinthe.Resolution.Helpers, only: [dataloader: 3]

  alias Myapp.Documents

  object :book do
    field :id, non_null(:id)
    field :name, non_null(:string)
    field :position, non_null(:integer)

    field :verses, list_of(:verse) do
      arg(:limit, :integer)

      resolve(dataloader(Documents, :verse, args: %{scope: :book}))
    end
  end
end
