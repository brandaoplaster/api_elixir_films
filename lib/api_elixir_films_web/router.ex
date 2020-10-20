defmodule ApiElixirFilmsWeb.Router do
  use ApiElixirFilmsWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :browser do
    plug(:accepts, ["html"])
  end
  
  scope "/api", ApiElixirFilmsWeb do
    pipe_through :api
  end

  scope "/", ApiElixirFilmsWeb do
    pipe_through :browser
    get "/", DefaultController, :index
  end
end
