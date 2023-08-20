defmodule ToyRobot.Table do
  defstruct [:x_boundary, :y_boundary]

  alias ToyRobot.Table

  @doc """
  Determines if a position would be within the tables boundaries.

  ## Examples

    iex> alias ToyRobot.Table
    ToyRobot.Table
    iex> table = %Table{x_boundary: 4, y_boundary: 4}
    %Table{x_boundary: 4, y_boundary: 4}
    iex> table |> Table.valid_position?(%{x: 4, y: 4})
    true
    iex> table |> Table.valid_position?(%{x: 0, y: 0})
    true
    iex> table |> Table.valid_position?(%{x: 0, y: 6})
    false
  """
  def valid_position?(
    %Table{x_boundary: x_boundary, y_boundary: y_boundary},
    %{x: x, y: y}
  ) do
    x >= 0 && x <= x_boundary && y >= 0 && y <= y_boundary
  end
end
