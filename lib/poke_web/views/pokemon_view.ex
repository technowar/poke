defmodule PokeWeb.PokemonView do
  use PokeWeb, :view
  alias PokeWeb.PokemonView

  def render("show.json", %{pokemon: pokemon}) do
    %{data: render_one(pokemon, PokemonView, "pokemon.json")}
  end

  def render("pokemon.json", %{pokemon: pokemon}) do
    %{id: pokemon}
  end
end
