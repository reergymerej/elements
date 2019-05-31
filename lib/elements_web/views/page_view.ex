defmodule ElementsWeb.PageView do
  use ElementsWeb, :view

  def get_element_names() do
    ElementsWeb.Elements.names()
  end

  def get_symbol(element) do
    ElementsWeb.Elements.get_symbol(element)
  end

  def get_element_symbol(name) do
    ElementsWeb.Elements.symbol_by_name(name)
  end
end
