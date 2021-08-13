defmodule PokeWeb.Router do
  use PokeWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", PokeWeb do
    resources "/", HealthController, only: [:index]
  end

  scope "/api/v2", PokeWeb do
    pipe_through :api

    resources "/pokemon", PokemonController, only: [:show]
  end
end
