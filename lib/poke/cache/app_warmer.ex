defmodule Poke.Cache.AppWarmer do
  @moduledoc """
  Cache.AppWarmer context.
  """

  use Cachex.Warmer
  alias Poke.Cache

  def interval, do: :timer.hours(1)

  def execute(_args) do
    Cache.Module.cache_app()
  end
end
