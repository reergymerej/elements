defmodule ElementsWeb.Elements do
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

    "Beryllium"	=> %{
      name: "Beryllium",
      symbol: "be",
      atomic_number: 4,
    },
  }

  # The keys in elements are strings, so we can access them like this.
  def by_name(name) do
    @elements[name][:symbol]
  end

  def names() do
    Enum.map(@elements, fn {name, _} -> name end)
  end

  def get_symbol(element) do
    element.symbol
  end

  def by_symbol(symbol) do
    case Enum.find(@elements, fn {_name, value} -> value[:symbol] == symbol end) do
      { _name, element } -> element
      _ -> nil
    end
  end
end
