defmodule ElementsWeb.ElementsTest do
  use ExUnit.Case
  import ElementsWeb.Elements

  defp contains(list, item) do
    Enum.member?(list, item) == true
  end

  test "get_symbol_by_name" do
    assert get_symbol_by_name("Lithium") == "li"
  end

  test "names" do
    assert names() |> contains("Helium")
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
end
