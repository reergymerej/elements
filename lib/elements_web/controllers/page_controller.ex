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

  def intersection(conn, params) do
    render(conn, "intersection.html", get_intersection_assigns(params))
  end

  defp get_intersection_assigns(params) do
    parse_sides(params)
    |> add_intersect()
  end

  defp parse_sides(params) do
    %{
      a: %{
        top: get_int(params["a"]["top"]),
        bottom: get_int(params["a"]["bottom"]),
        left: get_int(params["a"]["left"]),
        right: get_int(params["a"]["right"]),
      },

      b: %{
        top: get_int(params["b"]["top"]),
        bottom: get_int(params["b"]["bottom"]),
        left: get_int(params["b"]["left"]),
        right: get_int(params["b"]["right"]),
      },
    }
  end

  defp get_int(string) do
    case Integer.parse(string) do
      {val, ""} ->
        val
      _ ->
        # TODO: We should probably throw or make this a maybe-int.
        0
    end
  end

  defp add_intersect(boxes) do
    Map.put(boxes, :intersect, do_these_intersect(boxes))
  end

  defp do_these_intersect(boxes) do
    ElementsWeb.Intersections.boxes_intersect(
      boxes.a,
      boxes.b
    )
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
