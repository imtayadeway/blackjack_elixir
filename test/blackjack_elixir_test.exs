defmodule BlackjackElixirTest do
  use ExUnit.Case
  doctest BlackjackElixir

  import ExUnit.CaptureIO

 # test "make builds the application" do
 #   assert {_, 0} = System.cmd("make", ["blackjack"])
 #   assert {"hello\n", 0} = System.cmd(Path.join(File.cwd!, "blackjack_elixir"), [])
 # end

  test "I can hit or stay" do
    pid = spawn(fn ->
        System.cmd(Path.join(File.cwd!, "blackjack_elixir"), [],
        into: IO.stream(:stdio, :line)) end)

    Process.sleep(10000)

    IO.inspect(Process.alive?(pid), label: "alive?")
    IO.puts(:stdio, "h")
    Process.sleep(1000)
    IO.inspect(Process.alive?(pid), label: "alive?")

    Process.sleep(10000)
  end
end
