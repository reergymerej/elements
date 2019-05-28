defmodule ElementsWeb.PageView do
  use ElementsWeb, :view

  @elements %{
    "Hydrogen" => %{
      name: "Hydrogen",
      symbol: "h",
      atomic_number: 1,
    },

    "Helium" => %{
      name: "Helium",
      symbol: "he",
      atomic_number: 2,
    },

    "Lithium" => %{
      name: "Lithium",
      symbol: "li",
      atomic_number: 3,
    },
  }

  def get_element_names() do
    Enum.map(@elements, fn {name, _} -> name end)
  end

  def get_symbol(element) do
    element.symbol
  end

  # The keys in elements are strings, so we can access them like this.
  def get_element_symbol(name) do
    @elements[name][:symbol]
  end
end
