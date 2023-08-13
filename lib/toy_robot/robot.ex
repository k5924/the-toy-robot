defmodule ToyRobot.Robot do
  alias ToyRobot.Robot
  defstruct [y: 0, x: 0, facing: :north]
  @doc """
  Moves the robot one space in the direction it is facing.

  ## Example

    iex> alias ToyRobot.Robot
    ToyRobot.Robot
    iex> robot = %Robot{y: 0, facing: :north}
    %Robot{y: 0, facing: :north}
    iex> robot |> Robot.move
    %Robot{y: 1}
  """
  def move(%__MODULE__{facing: facing} = robot) do
    case facing do
      :north -> robot |> move_north
      :east -> robot |> move_east
      :south -> robot |> move_south
      :west -> robot |> move_west
    end
  end

  @doc """
  Turns the robot left.

  ## Example

    iex> alias ToyRobot.Robot
    ToyRobot.Robot
    iex> robot = %Robot{facing: :north}
    %Robot{facing: :north}
    iex> robot |> Robot.turn_left
    %Robot{facing: :west}
  """
  def turn_left(%Robot{facing: facing}) do
    case facing do
      :north -> %Robot{facing: :west}
      :east -> %Robot{facing: :north}
      :south -> %Robot{facing: :east}
      :west -> %Robot{facing: :south}
    end
  end

  @doc """
  Turns the robot right.

  ## Example

    iex> alias ToyRobot.Robot
    ToyRobot.Robot
    iex> robot = %Robot{facing: :north}
    %Robot{facing: :north}
    iex> robot |> Robot.turn_right
    %Robot{facing: :east}
  """
  def turn_right(%Robot{facing: facing}) do
    case facing do
      :north -> %Robot{facing: :east}
      :east -> %Robot{facing: :south}
      :south -> %Robot{facing: :west}
      :west -> %Robot{facing: :north}
    end
  end

  defp move_east(robot) do
    %Robot{x: robot.x + 1}
  end

  defp move_west(robot) do
    %Robot{x: robot.x - 1}
  end

  defp move_north(robot) do
    %Robot{y: robot.y + 1}
  end

  defp move_south(robot) do
    %Robot{y: robot.y - 1}
  end

end
