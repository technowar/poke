defmodule PokeWeb.MonsterController do
  use PokeWeb, :controller

  alias Poke.Pokemon

  def show(conn, %{"id" => id}) do
    monster = Pokemon.get_monster!(id)
    render(conn, "show.json", monster: monster)
  end
end
