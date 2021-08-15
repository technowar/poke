defmodule Poke.Pokemon do
  alias Poke.Services

  @moduledoc """
  Pokemon context.
  """

  @doc """
  Gets a single monster.
  """
  def get_pokemon!(id) do
    Services.get_pokemon_from_api(id)
  end
end
