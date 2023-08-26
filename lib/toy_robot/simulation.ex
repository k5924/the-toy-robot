defmodule ToyRobot.Simulation do
  alias ToyRobot.{Robot, Simulation, Table}
  defstruct [:table, :robot]

  @doc """
  Simulates placing a robot on a table.

  ## Examples

  When the robot is placed in a valid position
    
    iex> alias ToyRobot.{Robot, Simulation, Table}
    [ToyRobot.Robot, ToyRobot.Simulation, ToyRobot.Table]
    iex> table = %Table{x_boundary: 4, y_boundary: 4}
    %Table{x_boundary: 4, y_boundary: 4}
    iex> Simulation.place(table, %{x: 0, y: 0, facing: :north})
    {
      :ok,
      %Simulation{
          table: table, 
          robot: %Robot{x: 0, y: 0, facing: :north}
      }
    }
  """

  @doc """
  Simulates placing a robot on a table.

  ## Examples

  When the robot is placed in a invalid position
    
    iex> alias ToyRobot.{Robot, Simulation, Table}
    [ToyRobot.Robot, ToyRobot.Simulation, ToyRobot.Table]
    iex> table = %Table{x_boundary: 4, y_boundary: 4}
    %Table{x_boundary: 4, y_boundary: 4}
    iex> Simulation.place(table, %{x: 0, y: 6, facing: :north})
    {:error, :invalid_placement}
  """
  def place(table, placement) do
    if table |> Table.valid_position?(placement) do
      {
          :ok,
          %__MODULE__{
              table: table,
              robot: struct(Robot, placement)
          }
      }
    else 
      {:error, :invalid_placement}
    end
  end

  @doc """
  Moves the robot forward one space in the direction that it is facing, unless that position is past the boundaries of the table.

  ## Examples

  ### A valid movement

    iex> alias ToyRobot.{Robot, Simulation, Table}
    [ToyRobot.Robot, ToyRobot.Simulation, ToyRobot.Table]
    iex> table = %Table{x_boundary: 4, y_boundary: 4}
    %Table{x_boundary: 4, y_boundary: 4}
    iex> simulation = %Simulation{
    ...>    table: table,
    ...>    robot: %Robot{x: 0, y: 0, facing: :north}
    ...> }
    iex> simulation |> Simulation.move
    {
        :ok, %Simulation{
            table: table,
            robot: %Robot{x: 0, y: 1, facing: :north}
        }
    }
  """

  @doc """
  ### An invalid movement:

    iex> alias ToyRobot.{Robot, Table, Simulation}
    [ToyRobot.Robot, ToyRobot.Table, ToyRobot.Simulation]
    iex> table = %Table{x_boundary: 4, y_boundary: 4}
    %Table{x_boundary: 4, y_boundary: 4}
    iex> simulation = %Simulation {
    ...> table: table,
    ...> robot: %Robot{x: 0, y: 4, facing: :north}
    ...> }
    iex> simulation |> Simulation.move()
    {:error, :at_table_boundary}
  """
  def move(%Simulation{robot: robot, table: table} = simulation) do
    with moved_robot <- robot |> Robot.move,
      true           <- table |> Table.valid_position?(moved_robot)
    do
      {:ok, %{simulation | robot: moved_robot}}
    else 
      false -> {:error, :at_table_boundary}
    end
  end

  @doc """
  Turns the robot left.

  ### Examples
    
    iex> alias ToyRobot.{Robot, Table, Simulation}
    [ToyRobot.Robot, ToyRobot.Table, ToyRobot.Simulation]
    iex> table = %Table{x_boundary: 4, y_boundary: 4}
    %Table{x_boundary: 4, y_boundary: 4}
    iex> simulation = %Simulation {
    ...> table: table,
    ...> robot: %Robot{x: 0, y: 0, facing: :north}
    ...> }
    iex> simulation |> Simulation.turn_left
    {:ok, %Simulation{
        table: table,
        robot: %Robot{x: 0, y: 0, facing: :west}
      }}
  """
  def turn_left(%Simulation{robot: robot} = simulation) do
    {:ok, %{simulation | robot: robot |> Robot.turn_left}}
  end

  @doc """
  Turns the robot right.

  ### Examples
    
    iex> alias ToyRobot.{Robot, Table, Simulation}
    [ToyRobot.Robot, ToyRobot.Table, ToyRobot.Simulation]
    iex> table = %Table{x_boundary: 4, y_boundary: 4}
    %Table{x_boundary: 4, y_boundary: 4}
    iex> simulation = %Simulation {
    ...> table: table,
    ...> robot: %Robot{x: 0, y: 0, facing: :north}
    ...> }
    iex> simulation |> Simulation.turn_right
    {:ok, %Simulation{
        table: table,
        robot: %Robot{x: 0, y: 0, facing: :east}
      }}
  """
  def turn_right(%Simulation{robot: robot} = simulation) do
    {:ok, %{simulation | robot: robot |> Robot.turn_right}}
  end

  @doc """
  Reports the robot's current position.

  ### Examples
    
    iex> alias ToyRobot.{Robot, Table, Simulation}
    [ToyRobot.Robot, ToyRobot.Table, ToyRobot.Simulation]
    iex> table = %Table{x_boundary: 4, y_boundary: 4}
    %Table{x_boundary: 4, y_boundary: 4}
    iex> simulation = %Simulation {
    ...> table: table,
    ...> robot: %Robot{x: 0, y: 0, facing: :north}
    ...> }
    iex> simulation |> Simulation.report
    %Robot{x: 0, y: 0, facing: :north}
  """
  def report(%Simulation{robot: robot}), do: robot
end
