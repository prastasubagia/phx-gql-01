defmodule MyappWeb.VerseController do
  use MyappWeb, :controller

  alias Myapp.Documents
  alias Myapp.Documents.Verse

  action_fallback MyappWeb.FallbackController

  def index(conn, _params) do
    verses = Documents.list_verses()
    render(conn, "index.json", verses: verses)
  end

  def create(conn, %{"verse" => verse_params}) do
    with {:ok, %Verse{} = verse} <- Documents.create_verse(verse_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.verse_path(conn, :show, verse))
      |> render("show.json", verse: verse)
    end
  end

  def show(conn, %{"id" => id}) do
    verse = Documents.get_verse!(id)
    render(conn, "show.json", verse: verse)
  end

  def update(conn, %{"id" => id, "verse" => verse_params}) do
    verse = Documents.get_verse!(id)

    with {:ok, %Verse{} = verse} <- Documents.update_verse(verse, verse_params) do
      render(conn, "show.json", verse: verse)
    end
  end

  def delete(conn, %{"id" => id}) do
    verse = Documents.get_verse!(id)

    with {:ok, %Verse{}} <- Documents.delete_verse(verse) do
      send_resp(conn, :no_content, "")
    end
  end
end
