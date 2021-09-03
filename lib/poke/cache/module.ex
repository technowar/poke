defmodule Poke.Cache.Module do
  @moduledoc """
  Cache.Module context.
  """

  def cache_app do
    {:ok, [ttl: :timer.hours(1)]}
  end
end
