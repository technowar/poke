defmodule Poke.Pokemon do
  alias Poke.PokemonServices

  @moduledoc """
  Pokemon context.
  """

  @doc """
  Gets a single monster.

  ## Examples

      iex> get_monster!(id)
      returns id

  """
  def get_pokemon!(id) do
    PokemonServices.get_pokemon_from_api(id)
  end
end
