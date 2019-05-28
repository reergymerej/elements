defmodule ElementsWeb.PageController do
  use ElementsWeb, :controller

  @unknown "???"

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def view(conn, %{"symbol" => symbol}) do
    render(
      conn,
	get_template(symbol),
        get_element(symbol)
    )

    # assigns - a dictionary with the assigns to be used in the view. Those
    # assigns are merged and have higher precedence than the connection assigns
    # (conn.assigns)
  end

  defp get_template(symbol) do
    case get_element(symbol) do
      %{symbol: @unknown} -> "view-unknown-element.html"
      _ -> "view-element.html"
    end
  end

  defp get_element(symbol) do
    ElementsWeb.Elements.by_symbol(symbol)
  end
end
