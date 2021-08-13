defmodule PokeWeb.Router do
  use PokeWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api/v2", PokeWeb do
    pipe_through :api

    get "/monsters/:id", MonsterController, :show
  end
end
