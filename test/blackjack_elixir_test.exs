defmodule BlackjackElixirTest do
  use ExUnit.Case
  doctest BlackjackElixir

  test "make builds the application" do
    assert {_, 0} = System.cmd("make", ["blackjack"])
    assert {"hello\n", 0} = System.cmd(Path.join(File.cwd!, "blackjack_elixir"), [])
  end
end
