defmodule ToyRobot.CLI do
  def main([file_name]) do
    File.stream!(file_name)
    |> Enum.map(&String.trim/1)
    |> ToyRobot.CommandInterpreter.interpret
    |> ToyRobot.CommandRunner.run
  end

  def main([]) do
    IO.puts "Usage: toy_robot commands.txt"
  end

  def main(_) do
    IO.puts "Usage: toy_robot commands.txt"
  end

end
