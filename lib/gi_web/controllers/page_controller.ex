defmodule GiWeb.PageController do
  use GiWeb, :controller

  def home(conn, _params) do
    redirect(conn, to: "/create")
  end
end
