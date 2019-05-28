defmodule ElementsWeb.Assertions do
  def contains(list, item) do
    Enum.member?(list, item) == true
  end
end
