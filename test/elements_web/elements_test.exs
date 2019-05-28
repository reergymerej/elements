defmodule ElementsWeb.ElementsTest do
  use ExUnit.Case

  test "get_symbol_by_name" do
    # TODO: Expose these methods without the namespace.
    assert ElementsWeb.Elements.get_symbol_by_name("Lithium") == "li"
  end

  test "names" do
    # TODO: find a way to do a partial match
    assert ElementsWeb.Elements.names() == [
      "Beryllium",
      "Helium",
      "Hydrogen",
      "Lithium",
    ]
  end

  test "get_symbol" do
    assert ElementsWeb.Elements.get_symbol(%{ symbol: "horse"}) == "horse"
  end

  test "by_symbol" do
    assert ElementsWeb.Elements.by_symbol("be") == %{
      name: "Beryllium",
      symbol: "be",
      atomic_number: 4,
    }
  end
end
