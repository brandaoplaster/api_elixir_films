defmodule ApiElixirFilmsWeb.DefaultController do
  use ApiElixirFilmsWeb, :controller

  def index(conn, _params) do
    text conn, "Hi, Api"
  end
end