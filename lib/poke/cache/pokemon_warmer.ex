defmodule Poke.PokemonWarmer do
  @moduledoc """
  PokemonWarmer context.
  """

  use Cachex.Warmer
  alias Poke.CacheModule

  def interval, do: :timer.hours(1)

  def execute(_args) do
    CacheModule.cache_app()
  end
end
