defmodule Myapp.GraphQL.Schema do
  use Absinthe.Schema

  alias Myapp.Documents

  import_types(Myapp.GraphQL.Types.Index)
  import_types(Myapp.GraphQL.Queries.Index)

  query do
    import_fields(:book_queries)
    import_fields(:verse_queries)
  end

  # Dataloader

  def context(ctx) do
    loader =
      Dataloader.new()
      |> Dataloader.add_source(Documents, Documents.datasource())

    Map.put(ctx, :loader, loader)
  end

  def plugins, do: [Absinthe.Middleware.Dataloader | Absinthe.Plugin.defaults()]
end
