defmodule Poke.Services.Evolution do
  @moduledoc """
  Services.Evolution context.
  """

  alias Poke.Helpers

  @doc """
  Fetch Pokemon evolution line from PokeAPI.
  """
  def get_pokemon_evolution_from_api(param) do
    Helpers.create_endpoint(%{endpoint: Helpers.get_key(:pokemon_evolution_endpoint), param: param})
  end
end
