defmodule ElementsWeb.ElementsTest do
  use ExUnit.Case
  # To make it clear that this is provided by a helper module, alias it instead
  # of importing.
  alias ElementsWeb.Assertions, as: Ass
  # Since we're testing this, it makes sense to expose all its members.
  import ElementsWeb.Elements

  test "symbol_by_name" do
    assert symbol_by_name("Lithium") == "li"
  end

  test "names" do
    # 🙊
    assert names() |> Ass.contains("Helium")
  end

  test "get_symbol" do
    assert get_symbol(%{ symbol: "horse"}) == "horse"
  end

  test "by_symbol" do
    assert by_symbol("be") == %{
      name: "Beryllium",
      symbol: "be",
      atomic_number: 4,
    }
  end

  test "by_symbol, nil" do
    assert by_symbol("xyz") == nil
  end

  @tag :pending
  test "elements should be shimmed to have all values" do
    assert symbol_by_name("Helium")[:atomic_weight] == nil
  end
end
