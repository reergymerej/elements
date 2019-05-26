defmodule ElementsWeb.PageController do
  use ElementsWeb, :controller

  @unknown "???"

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def view(conn, %{"symbol" => symbol}) do
    # %{"foo" => "bar"} is a map

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
    case symbol do
      "h" -> %{
        symbol: "h",
        name: "Hydrogen",
        atomic_number: 1,
      }

      "he" -> %{
        symbol: "he",
        name: "Helium",
        atomic_number: 2,
      }

      "li" -> %{
          symbol: "li",
          name: "Lithium",
          atomic_number: 3,
      }

      _ -> %{ symbol: @unknown }
    end
  end
end
