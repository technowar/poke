defmodule Poke.Structs.Pokemon do
  @moduledoc """
  Structs.Pokemon context.
  """

  @derive {Jason.Encoder, only: [:height, :id, :name, :stats, :types, :weight]}
  defstruct [:height, :id, :name, :stats, :types, :weight]

  def pokemon(params),
    do: %{
      height: params["height"],
      id: params["id"],
      name: params["name"],
      stats:
        Enum.map(params["stats"], fn %{"base_stat" => base_stat, "stat" => stat} ->
          %{stat["name"] => base_stat}
        end),
      types: Enum.map(params["types"], fn %{"type" => type} -> type["name"] end),
      weight: params["weight"]
    }
end
