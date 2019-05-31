defmodule ElementsWeb.Elements do
  @elements %{
    "Hydrogen" => %{
      name: "Hydrogen",
      symbol: "h",
      atomic_number: 1,
      atomic_weight: 1.00794,
    },

    "Helium" => %{
      name: "Helium",
      symbol: "he",
      atomic_number: 2,
      atomic_weight: nil,
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

    "Carbon" => %{
      name: "Carbon",
      symbol: "c",
      atomic_number: 6,
      atomic_weight: 2.0107,
    },
  }

  # The keys in elements are strings, so we can access them like this.
  def symbol_by_name(name) do
    get_symbol(
      @elements[name]
    )
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
