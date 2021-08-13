defmodule Poke.Helpers do
  @moduledoc """
  Helpers context.
  """

  @doc """
  Create an endpoint based on the parameters given.

  ## Examples

      iex> create_endpoint(%{endpoint: "https://some_api.com/", param: "param"})
      returns "https://some_api.com/param"

  """
  def create_endpoint(params), do: IO.iodata_to_binary(Map.values(params))
end
