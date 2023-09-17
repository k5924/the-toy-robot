defmodule ToyRobot.Game.ServerTest do
  use ExUnit.Case, async: true

  alias ToyRobot.Game.Server

  setup do
    {:ok, game} = Server.start_link([x_boundary: 4, y_boundary: 4])
    {:ok, %{game: game}}
  end

  test "can place a player", %{game: game} do
    :ok = Server.place(game, %{x: 0, y: 0, facing: :north}, "Rosie")
    assert Server.player_count(game) == 1
  end
end
