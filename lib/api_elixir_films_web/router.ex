defmodule ApiElixirFilmsWeb.Router do
  use ApiElixirFilmsWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ApiElixirFilmsWeb do
    pipe_through :api
  end
end
