defmodule ElementsWeb.Intersections do
  def ranges_intersect({left, right}, {min, max}) do
    not (right < min or left > max)
  end

  def boxes_intersect(a, b) do
    ranges_intersect(
      {a.left, a.right},
      {b.left, b.right}
    )
    && ranges_intersect(
      {a.top, a.bottom},
      {b.top, b.bottom}
    )
  end
end
