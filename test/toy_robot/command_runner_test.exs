defmodule ToyRobot.CommandRunnerTest do
  use ExUnit.Case, async: true

  alias ToyRobot.{CommandRunner, Simulation}

  test "handles a valid place command" do
    %Simulation{robot: robot} = CommandRunner.run([{:place, %{x: 1, y: 2, facing: :north}}])

    assert robot.x == 1
    assert robot.y == 2
    assert robot.facing == :north
  end

  test "handles an invalid place command" do
    simulation = CommandRunner.run([{:place, %{x: 10, y: 10, facing: :north}}])

    assert simulation == nil
  end

  test "ignores commands until a valid placement" do
    %Simulation{robot: robot} = [
      :move,
      {:place, %{x: 1, y: 2, facing: :north}},
    ]
    |> CommandRunner.run()

    assert robot.x == 1
    assert robot.y == 2
    assert robot.facing == :north
  end

end
