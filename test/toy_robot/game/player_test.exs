defmodule ToyRobot.Game.PlayerTest do
  use ExUnit.Case, async: true

  alias ToyRobot.Game.Player
  alias ToyRobot.Robot

  describe "report" do
    setup do
      starting_position = %Robot{x: 0, y: 0, facing: :north}
      {:ok, player} = Player.start(starting_position)
      %{player: player}
    end

    test "shows the current position of the robot", %{player: player} do
      assert Player.report(player) == %Robot{
        x: 0,
        y: 0,
        facing: :north
      }
    end
  end

  describe "move" do
    setup do
      starting_position = %Robot{x: 0, y: 0, facing: :north}
      {:ok, player} = Player.start(starting_position)
      %{player: player}
    end

    test "moves the robot forward one space", %{player: player} do
      :ok = Player.move(player)

      assert Player.report(player) == %Robot{
        x: 0,
        y: 1,
        facing: :north
      }
    end
  end
end
