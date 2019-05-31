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
    #
  end

  def intersection(conn, %{
    "a_top" => a_top,
    "a_bottom" => a_bottom,
    "a_left" => a_left,
    "a_right" => a_right,
  }) do
    render(conn, "intersection.html", %{
      a: %{
        top: a_top,
        bottom: a_bottom,
        left: a_left,
        right: a_right,
      },

      b: %{
        top: 10,
        bottom: 20,
        left: 10,
        right: 20,
      },

      intersect: do_these_intersect(%{
        a: %{
          top: a_top,
          bottom: a_bottom,
          left: a_left,
          right: a_right,
        },

        b: %{
          top: 10,
          bottom: 20,
          left: 10,
          right: 20,
        },
      }),
    })
  end

  defp do_these_intersect(info) do
    case Integer.parse(info.a.top) do
      {a_top, ""} ->
        a_top < 100
      _ -> false
    end
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
