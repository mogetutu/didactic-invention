defmodule ElixirApp.PageController do
  use ElixirApp.Web, :controller

  def index(conn, _params) do
    conn
    |>render("index.html")
  end
end
