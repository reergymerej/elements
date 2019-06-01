defmodule ElementsWeb.IntersectionsTest do
  use ExUnit.Case
  import ElementsWeb.Intersections

  test "is_within_range" do
    assert is_within_range(1, {0, 3}) == true
    assert is_within_range(0, {1, 3}) == false
    assert is_within_range(4, {0, 3}) == false
    assert is_within_range(4, {0, 4}) == true
  end

  test "ranges_intersect" do
    assert ranges_intersect({0, 3}, {1, 4}) == true
    assert ranges_intersect({0, 3}, {4, 5}) == false
  end

  test "boxes_intersect" do
    assert boxes_intersect(
      %{left: 0, right: 10, top: 0, bottom: 10},
      %{left: 0, right: 10, top: 50, bottom: 60}
    ) == false

    assert boxes_intersect(
      %{left: 0, right: 10, top: 0, bottom: 10},
      %{left: 0, right: 10, top: 5, bottom: 60}
    ) == true

    assert boxes_intersect(
      %{left: 100, right: 200, top: 0, bottom: 10},
      %{left: 0, right: 10, top: 5, bottom: 60}
    ) == false
  end
end
