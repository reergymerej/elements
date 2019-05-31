defmodule ElementsWeb.Router do
  use ElementsWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ElementsWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  scope "/element", ElementsWeb do
    pipe_through :browser

    get "/:symbol", PageController, :view
  end

  scope "/intersection", ElementsWeb do
    pipe_through :browser

    get "/:a_top/:a_bottom/:a_left/:a_right", PageController, :intersection
  end

  # Other scopes may use custom stacks.
  # scope "/api", ElementsWeb do
  #   pipe_through :api
  # end
end
