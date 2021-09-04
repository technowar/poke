defmodule Poke.Evolution do
  @moduledoc """
  Evolution context.
  """

  alias Poke.Services

  @doc """
  Gets the Pokemon evolution chain.
  """
  def get_evolution!(id) do
    Services.Evolution.get_pokemon_evolution_from_api(id)
  end
end
