defmodule ElementsWeb.PageController do
  use ElementsWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def view(conn, %{"symbol" => symbol}) do
    render(
      conn,
      get_template(symbol),
      get_assigns(symbol)
    )

    # assigns - a dictionary with the assigns to be used in the view. Those
    # assigns are merged and have higher precedence than the connection assigns
    # (conn.assigns)
  end

  defp get_template(symbol) do
    if ElementsWeb.Elements.by_symbol(symbol) do
      "view-element.html"
    else
      "view-unknown-element.html"
    end
  end

  defp get_assigns(symbol) do
    ElementsWeb.Elements.by_symbol(symbol) || %{symbol: symbol}
  end
end
