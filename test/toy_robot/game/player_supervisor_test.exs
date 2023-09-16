defmodule ToyRobot.Game.PlayerSupervisorTest do
  use ExUnit.Case, async: true

  alias ToyRobot.{Game.PlayerSupervisor, Robot}

  test "starts a game child process" do
    robot = %Robot{x: 0, y: 0, facing: :north}
    {:ok, player} = PlayerSupervisor.start_child(robot, "Izzy")

    [{registered_player, _}] = Registry.lookup(ToyRobot.Game.PlayerRegistry, "Izzy")
    assert registered_player == player
  end
 

  test "starts a registry" do
    registry = Process.whereis(ToyRobot.Game.PlayerRegistry)
    assert registry
  end

  test "moves a robot forward" do
    robot = %Robot{x: 0, y: 0, facing: :north}
    {:ok, _player} = PlayerSupervisor.start_child(robot, "Charlie")
    %{robot: %{y: y}} = PlayerSupervisor.move("Charlie")

    assert y == 1
  end
end
