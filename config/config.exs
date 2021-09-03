# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the endpoint
config :poke, PokeWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "GjeUlg0XwsKYY8GmZNFmn3XinaTh+FbCsw9yd/cjkKoHDj5bnxN9z00fS0ghrN4W",
  render_errors: [view: PokeWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Poke.PubSub,
  live_view: [signing_salt: "r/uVQO6T"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :poke, :pokemon_endpoint, "https://pokeapi.co/api/v2/pokemon/"
config :poke, :pokemon_evolution_endpoint, "https://pokeapi.co/api/v2/evolution-chain/"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
