defmodule ElementsWeb.PageControllerTest do
  use ElementsWeb.ConnCase

  @tag :pending
  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Welcome to Phoenix!"
  end

  test "GET /element/asdf", %{conn: conn} do
    conn = get(conn, "/element/asdf")
    assert html_response(conn, 200) =~ "What?"
  end

  test "GET /intersection", %{conn: conn} do
    conn = get(conn, "/intersection")
    assert html_response(conn, 200) =~ "intersection"
  end
end
