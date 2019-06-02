defmodule ElementsWeb.IntersectionsTest do
  use ExUnit.Case
  import ElementsWeb.Intersections

  test "boxes_intersect" do
    assert boxes_intersect(
      %{ top: 0, bottom: 15, left: 0, right: 9 },
      %{ top: 2, bottom: 16, left: 3, right: 8 }
    ) == true
  end
end
