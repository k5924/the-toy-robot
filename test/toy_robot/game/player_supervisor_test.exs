defmodule ToyRobot.Game.PlayerSupervisorTest do
  use ExUnit.Case, async: true

  alias ToyRobot.{Game.PlayerSupervisor, Table}

  def build_table do
    %Table{
        x_boundary: 4,
        y_boundary: 4
      }
  end

  test "starts a game child process" do
    starting_position = %{x: 0, y: 0, facing: :north}
    {:ok, player} = PlayerSupervisor.start_child(build_table(), starting_position, "Izzy")

    [{registered_player, _}] = Registry.lookup(ToyRobot.Game.PlayerRegistry, "Izzy")
    assert registered_player == player
  end
 

  test "starts a registry" do
    registry = Process.whereis(ToyRobot.Game.PlayerRegistry)
    assert registry
  end

  test "moves a robot forward" do
    starting_position = %{x: 0, y: 0, facing: :north}
    {:ok, _player} = PlayerSupervisor.start_child(build_table(), starting_position, "Charlie")
    :ok = PlayerSupervisor.move("Charlie")
    %{y: y} = PlayerSupervisor.report("Charlie")

    assert y == 1
  end

  test "reports a robots location" do
    starting_position = %{x: 0, y: 0, facing: :north}
    {:ok, _player} = PlayerSupervisor.start_child(build_table(), starting_position, "Davros")
    %{y: y} = PlayerSupervisor.report("Davros")

    assert y == 0
  end
end
