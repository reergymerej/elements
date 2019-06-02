defmodule ElementsWeb.Intersections do
  def ranges_intersect({left, right}, {min, max}) do
    a = Range.new(left, right)
    b = Range.new(min, max)
    not Range.disjoint?(a, b)
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
