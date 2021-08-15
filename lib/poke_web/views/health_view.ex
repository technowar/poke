defmodule PokeWeb.HealthView do
  use PokeWeb, :view

  def render("index.json", _params), do: %{healthy: true}
end
