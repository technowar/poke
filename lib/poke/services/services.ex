defmodule Poke.Services do
  @moduledoc """
  Services.Services context.
  """

  @doc """
  Call endpoint using HTTPoison.

  ## Examples

      iex> get("https://some_api.com/param")
      returns %{:ok, 200, %Structs.Pokemon{}}

      iex> get("https://some_api.com/not_found")
      returns %{:ok, 404, "Not Found"}

      iex> get("https://some_api.com/bad_request")
      returns %{:error, "Remote Bad Response"}

  """
  def get(endpoint) do
    HTTPoison.get(endpoint)
    |> case do
      {:ok, %{status_code: code, body: body}} ->
        {:ok, code, body}

      {:error, %{reason: reason}} ->
        {:error, reason}
    end
  end
end
