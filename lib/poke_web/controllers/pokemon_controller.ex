defmodule PokeWeb.PokemonController do
  use PokeWeb, :controller
  alias Poke.Pokemon

  def show(conn, params) do
    pokemon = Pokemon.get_pokemon!(params["id"])
    render(conn, "show.json", pokemon: pokemon)
  end
end
