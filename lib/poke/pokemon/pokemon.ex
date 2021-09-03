defmodule Poke.Pokemon do
  @moduledoc """
  Pokemon context.
  """

  alias Poke.Services

  @doc """
  Gets a single monster.
  """
  def get_pokemon!(id) do
    Services.Pokemon.get_pokemon_from_api(id)
  end
end
