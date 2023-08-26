defmodule ToyRobot.CommandInterpreter do

  @doc """
  Interprets commands from a commands list, in preperation for running them.

  ### Examples

    iex> alias ToyRobot.CommandInterpreter
    ToyRobot.CommandInterpreter
    iex> commands = ["PLACE 1, 2, NORTH", "MOVE", "LEFT", "RIGHT", "REPORT"]
    ["PLACE 1, 2, NORTH", "MOVE", "LEFT", "RIGHT", "REPORT"]
    iex> commands |> CommandInterpreter.interpret()
    [
      {:place, %{x: 1, y: 2, facing: :north}},
      :move,
      :turn_left,
      :turn_right,
      :report,
    ]
  """
  def interpret(commands) do
    commands |> Enum.map(&do_interpret/1)
  end

  def do_interpret("PLACE " <> rest) do
    [x, y, facing] = rest |> String.split(", ")
    to_int = &String.to_integer/1
    {:place, %{
        x: to_int.(x),
        y: to_int.(y),
        facing: facing |> String.downcase |> String.to_atom
    }}
  end
end
