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

  test "GET /intersection/1/2/3/4/5/6/7/8", %{conn: conn} do
    conn = get(conn, "/intersection/1/2/3/4/5/6/7/8")
    assert html_response(conn, 200) =~ "1"
    assert html_response(conn, 200) =~ "2"
    assert html_response(conn, 200) =~ "3"
    assert html_response(conn, 200) =~ "4"
    assert html_response(conn, 200) =~ "5"
    assert html_response(conn, 200) =~ "6"
    assert html_response(conn, 200) =~ "7"
    assert html_response(conn, 200) =~ "8"
  end
end
