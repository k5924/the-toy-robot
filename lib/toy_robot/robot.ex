defmodule ToyRobot.Robot do
  alias ToyRobot.Robot
  defstruct [x: 0, y: 0, facing: :north]
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
  def turn_left(%Robot{facing: facing} = robot) do
    new_direction = case facing do
      :north -> :west
      :east -> :north
      :south -> :east
      :west -> :south
    end

    %Robot{robot | facing: new_direction}
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
  def turn_right(%Robot{facing: facing} = robot) do
    new_direction = case facing do
      :north -> :east
      :east -> :south
      :south -> :west
      :west -> :north
    end

    %Robot{robot | facing: new_direction}
  end

  defp move_east(robot) do
    %Robot{robot | x: robot.x + 1}
  end

  defp move_west(robot) do
    %Robot{robot | x: robot.x - 1}
  end

  defp move_north(robot) do
    %Robot{robot | y: robot.y + 1}
  end

  defp move_south(robot) do
    %Robot{robot | y: robot.y - 1}
  end

end
