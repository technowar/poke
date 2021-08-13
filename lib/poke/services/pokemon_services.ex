defmodule Poke.PokemonServices do
  alias Poke.Helpers

  @pokemon_endpoint "https://pokeapi.co/api/v2/pokemon/"

  @moduledoc """
  Services context.
  """

  @doc """
  Fetch Pokemon from Pokeapi.

  ## Examples

      iex> get_pokemon_from_api(1)
      returns %{status: 200, message: "success"}

      iex> get_pokemon_from_api("x")
      returns %{status: 500, message: "Remote Bad Response"}

      iex> get_pokemon_from_api("y")
      returns %{status: 404, message: "Not Found"}

      iex> get_pokemon_from_api("z")
      returns %{reason: "Unhandled"}

  """
  def get_pokemon_from_api(param) do
    endpoint = Helpers.create_endpoint(%{endpoint: @pokemon_endpoint, param: param})

    case HTTPoison.get(endpoint) do
      {:ok, %{status_code: 200, body: body}} ->
        case Jason.decode(body) do
          {:ok, response} ->
            IO.inspect(response)

            %{status: 200, message: "success"}

          {:error, _} ->
            %{status: 500, message: "Remote Bad Response"}
        end

      {:ok, %{status_code: 404, body: body}} ->
        %{status: 404, message: body}

      {:error, %{reason: reason}} ->
        %{reason: reason}
    end
  end
end
