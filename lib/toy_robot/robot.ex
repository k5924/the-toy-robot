defmodule ToyRobot.Robot do
  @doc """
  Moves the robot east one space.

  ## Example

    iex> alias ToyRobot.Robot
    ToyRobot.Robot
    iex> robot = %{x: 0}
    %{x: 0}
    iex> robot |> Robot.move_east
    %{x: 1}
    iex> robot |> Robot.move_east |> Robot.move_east |> Robot.move_east
    %{x: 3}
  """
  def move_east(robot) do
    %{x: robot.x + 1}
  end

  @doc """
  Moves the robot west one space.

  ## Example

    iex> alias ToyRobot.Robot
    ToyRobot.Robot
    iex> robot = %{x: 0}
    %{x: 0}
    iex> robot |> Robot.move_west
    %{x: -1}
    iex> robot |> Robot.move_west |> Robot.move_west |> Robot.move_west
    %{x: -3}
  """
  def move_west(robot) do
    %{x: robot.x - 1}
  end

  @doc """
  Moves the robot north one space.

  ## Example

    iex> alias ToyRobot.Robot
    ToyRobot.Robot
    iex> robot = %{y: 0}
    %{y: 0}
    iex> robot |> Robot.move_north
    %{y: 1}
    iex> robot |> Robot.move_north |> Robot.move_north |> Robot.move_north
    %{y: 3}
  """
  def move_north(robot) do
    %{y: robot.y + 1}
  end

  @doc """
  Moves the robot south one space.

  ## Example

    iex> alias ToyRobot.Robot
    ToyRobot.Robot
    iex> robot = %{y: 0}
    %{y: 0}
    iex> robot |> Robot.move_south
    %{y: -1}
    iex> robot |> Robot.move_south |> Robot.move_south |> Robot.move_south
    %{y: -3}
  """
  def move_south(robot) do
    %{y: robot.y - 1}
  end

end
