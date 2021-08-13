defmodule PokeWeb.Router do
  use PokeWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", PokeWeb do
    pipe_through :api
  end
end
