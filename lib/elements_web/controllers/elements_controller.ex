defmodule ElementsWeb.ElementsController do
  use ElementsWeb, :controller

  def view(conn, _params) do
    render(conn, "index.html")
  end
end
