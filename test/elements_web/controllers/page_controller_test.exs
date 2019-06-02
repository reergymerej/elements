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

  test "GET /intersection?a%5Btop%5D=1&a%5Bbottom%5D=2&a%5Bleft%5D=3&a%5Bright%5D=4&b%5Btop%5D=5&b%5Bbottom%5D=6&b%5Bleft%5D=7&b%5Bright%5D=8", %{conn: conn} do
    conn = get(conn, "/intersection?a%5Btop%5D=1&a%5Bbottom%5D=2&a%5Bleft%5D=3&a%5Bright%5D=4&b%5Btop%5D=5&b%5Bbottom%5D=6&b%5Bleft%5D=7&b%5Bright%5D=8")
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
