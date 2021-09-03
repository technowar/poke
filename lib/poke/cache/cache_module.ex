defmodule Poke.CacheModule do
  @moduledoc """
  CacheModule context.
  """

  def cache_app do
    {:ok, [ttl: :timer.hours(1)]}
  end
end
