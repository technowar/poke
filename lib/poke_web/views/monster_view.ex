defmodule PokeWeb.MonsterView do
  use PokeWeb, :view
  alias PokeWeb.MonsterView

  def render("show.json", %{monster: monster}) do
    %{data: render_one(monster, MonsterView, "monster.json")}
  end

  def render("monster.json", %{monster: monster}) do
    %{id: monster}
  end
end
