defmodule Poke.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    import Cachex.Spec

    children = [
      Supervisor.child_spec(
        {
          Cachex,
          name: :poke,
          warmers: [
            warmer(module: Poke.Cache.AppWarmer, state: "")
          ]
        },
        id: :poke
      ),
      Supervisor.child_spec({Cachex, name: :pokemon}, id: :pokemon),
      # Start the Telemetry supervisor
      PokeWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Poke.PubSub},
      # Start the Endpoint (http/https)
      PokeWeb.Endpoint
      # Start a worker by calling: Poke.Worker.start_link(arg)
      # {Poke.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Poke.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    PokeWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
