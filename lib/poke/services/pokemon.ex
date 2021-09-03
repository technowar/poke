defmodule Poke.Services.Pokemon do
  @moduledoc """
  Services.Pokemon context.
  """

  alias Poke.Cache
  alias Poke.Helpers
  alias Poke.Services
  alias Poke.Structs

  @doc """
  Fetch Pokemon from PokeAPI.

  ## Examples

      iex> get_pokemon_from_api(1)
      returns %{status: 200, message: "success", data: %Structs.Pokemon{}}

      iex> get_pokemon_from_api("y")
      returns %{status: 404, message: "Not Found"}

      iex> get_pokemon_from_api("x")
      returns %{status: 500, message: "Remote Bad Response"}

      iex> get_pokemon_from_api("z")
      returns %{status: 500, message: "Unhandled"}

  """
  def get_pokemon_from_api(param) do
    Cache.Pokemon.get_pokemon_from_cache(param)
    |> case do
      {:ok, nil} ->
        Helpers.create_endpoint(%{endpoint: Helpers.get_key(:pokemon_endpoint), param: param})
        |> Services.get()
        |> (fn
              {:ok, code, body} ->
                case code do
                  200 ->
                    body
                    |> Jason.decode()
                    |> case do
                      {:ok, response} ->
                        %{
                          status: code,
                          message: "success",
                          data:
                            Cache.Pokemon.set_pokemon_to_cache(
                              param,
                              Structs.Pokemon.pokemon(response)
                            )
                        }

                      {:error, _} ->
                        %{status: 500, message: "Remote Bad Response"}
                    end

                  _ ->
                    %{
                      status: code,
                      message: body
                    }
                end

              {:error, reason} ->
                %{status: 500, message: reason}
            end).()

      {:ok, value} ->
        %{
          status: 200,
          message: "success",
          data: value
        }
    end
  end
end
