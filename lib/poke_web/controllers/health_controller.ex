defmodule PokeWeb.HealthController do
  use PokeWeb, :controller

  def index(conn, _params) do
    render(conn, "index.json")
  end
end
