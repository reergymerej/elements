defmodule ElementsWeb.IntersectionsTest do
  use ExUnit.Case
  import ElementsWeb.Intersections

  test "ranges_intersect" do
    assert ranges_intersect({0, 3}, {1, 4}) == true
    assert ranges_intersect({0, 3}, {4, 5}) == false
    assert ranges_intersect(
      { 0, 9 },
      { 3, 8 }
    ) == true
    assert ranges_intersect(
      { 3, 8 },
      { 0, 9 }
    ) == true
  end

  test "boxes_intersect" do
    assert boxes_intersect(
      %{ top: 0, bottom: 15, left: 0, right: 9 },
      %{ top: 2, bottom: 16, left: 3, right: 8 }
    ) == true
  end
end
