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
  def move(simulation) do
    {:ok, simulation}
  end
end
