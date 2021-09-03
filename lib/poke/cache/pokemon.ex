defmodule Poke.Cache.Pokemon do
  @moduledoc """
  Cache.Pokemon context.
  """

  @doc """
  Get Pokemon from Cachex

  ## Examples

      iex> get_pokemon_from_cache(1)
      returns {:ok, nil}

      iex> get_pokemon_from_cache(1)
      returns {:ok, %Structs.Pokemon{}}

  """
  def get_pokemon_from_cache(param) do
    Cachex.get(:pokemon, param)
  end

  @doc """
  Set Pokemon to Cachex

  ## Examples

      iex> set_pokemon_to_cache(1, %Structs.Pokemon{})
      returns %Structs.Pokemon{}

  """
  def set_pokemon_to_cache(param, data) do
    Cachex.put(:pokemon, param, data, ttl: :timer.hours(60))

    data
  end
end
