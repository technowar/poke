defmodule PokeWeb.EvolutionController do
  use PokeWeb, :controller
  alias Poke.Evolution

  def show(conn, %{"id" => id}) do
    evolution = Evolution.get_evolution!(id)
    render(conn, "show.json", evolution: evolution)
  end
end
