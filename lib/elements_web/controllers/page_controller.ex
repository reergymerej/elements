defmodule ElementsWeb.PageController do
  use ElementsWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def view(conn, %{"symbol" => symbol}) do
    # %{"foo" => "bar"} is a map

    render(conn, "view-element.html",
      symbol: symbol,
      atomic_number: 99
    )
    # assigns - a dictionary with the assigns to be used in the view. Those
    # assigns are merged and have higher precedence than the connection assigns
    # (conn.assigns)
  end
end
