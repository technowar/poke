defmodule PokeWeb.EvolutionView do
  use PokeWeb, :view
  alias PokeWeb.EvolutionView

  def render("show.json", %{evolution: evolution}),
    do: render_one(evolution, EvolutionView, "evolution.json")

  def render("evolution.json", %{evolution: evolution}), do: evolution
end
