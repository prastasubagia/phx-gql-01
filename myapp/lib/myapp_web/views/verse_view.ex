defmodule MyappWeb.VerseView do
  use MyappWeb, :view
  alias MyappWeb.VerseView

  def render("index.json", %{verses: verses}) do
    %{data: render_many(verses, VerseView, "verse.json")}
  end

  def render("show.json", %{verse: verse}) do
    %{data: render_one(verse, VerseView, "verse.json")}
  end

  def render("verse.json", %{verse: verse}) do
    %{
      id: verse.id,
      chapter: verse.chapter,
      number: verse.number,
      body: verse.body
    }
  end
end
