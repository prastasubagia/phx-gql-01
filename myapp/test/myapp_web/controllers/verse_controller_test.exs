defmodule MyappWeb.VerseControllerTest do
  use MyappWeb.ConnCase

  import Myapp.DocumentsFixtures

  alias Myapp.Documents.Verse

  @create_attrs %{
    body: "some body",
    chapter: 42,
    number: 42
  }
  @update_attrs %{
    body: "some updated body",
    chapter: 43,
    number: 43
  }
  @invalid_attrs %{body: nil, chapter: nil, number: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all verses", %{conn: conn} do
      conn = get(conn, Routes.verse_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create verse" do
    test "renders verse when data is valid", %{conn: conn} do
      conn = post(conn, Routes.verse_path(conn, :create), verse: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.verse_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "body" => "some body",
               "chapter" => 42,
               "number" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.verse_path(conn, :create), verse: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update verse" do
    setup [:create_verse]

    test "renders verse when data is valid", %{conn: conn, verse: %Verse{id: id} = verse} do
      conn = put(conn, Routes.verse_path(conn, :update, verse), verse: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.verse_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "body" => "some updated body",
               "chapter" => 43,
               "number" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, verse: verse} do
      conn = put(conn, Routes.verse_path(conn, :update, verse), verse: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete verse" do
    setup [:create_verse]

    test "deletes chosen verse", %{conn: conn, verse: verse} do
      conn = delete(conn, Routes.verse_path(conn, :delete, verse))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.verse_path(conn, :show, verse))
      end
    end
  end

  defp create_verse(_) do
    verse = verse_fixture()
    %{verse: verse}
  end
end
