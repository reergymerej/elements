defmodule ElementsWeb.Intersections do
  def is_within_range(value, {left, right}) do
    left <= value
    and value <= right
  end

  def ranges_intersect({left, right}, rng) do
    is_within_range(left, rng)
    || is_within_range(right, rng)
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
