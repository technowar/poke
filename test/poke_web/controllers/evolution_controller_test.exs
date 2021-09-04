defmodule PokeWeb.EvolutionControllerTest do
  use PokeWeb.ConnCase

  alias Poke.Pokemon
  alias Poke.Pokemon.Evolution

  @create_attrs %{

  }
  @update_attrs %{

  }
  @invalid_attrs %{}

  def fixture(:evolution) do
    {:ok, evolution} = Pokemon.create_evolution(@create_attrs)
    evolution
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all evolutions", %{conn: conn} do
      conn = get(conn, Routes.evolution_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create evolution" do
    test "renders evolution when data is valid", %{conn: conn} do
      conn = post(conn, Routes.evolution_path(conn, :create), evolution: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.evolution_path(conn, :show, id))

      assert %{
               "id" => id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.evolution_path(conn, :create), evolution: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update evolution" do
    setup [:create_evolution]

    test "renders evolution when data is valid", %{conn: conn, evolution: %Evolution{id: id} = evolution} do
      conn = put(conn, Routes.evolution_path(conn, :update, evolution), evolution: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.evolution_path(conn, :show, id))

      assert %{
               "id" => id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, evolution: evolution} do
      conn = put(conn, Routes.evolution_path(conn, :update, evolution), evolution: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete evolution" do
    setup [:create_evolution]

    test "deletes chosen evolution", %{conn: conn, evolution: evolution} do
      conn = delete(conn, Routes.evolution_path(conn, :delete, evolution))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.evolution_path(conn, :show, evolution))
      end
    end
  end

  defp create_evolution(_) do
    evolution = fixture(:evolution)
    %{evolution: evolution}
  end
end
