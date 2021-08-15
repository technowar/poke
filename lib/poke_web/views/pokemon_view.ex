defmodule PokeWeb.PokemonView do
  use PokeWeb, :view
  alias PokeWeb.PokemonView

  def render("show.json", %{pokemon: pokemon}),
    do: render_one(pokemon, PokemonView, "pokemon.json")

  def render("pokemon.json", %{pokemon: pokemon}), do: pokemon
end
