defmodule BlackjackElixirTest do
  use ExUnit.Case
  doctest BlackjackElixir
  alias Porcelain.Process, as: Proc

  test "I can hit or stay" do
    {_, 0} = System.cmd("make", ["blackjack"])
    cmd = Path.join(File.cwd!, "blackjack_elixir")
    proc = Porcelain.spawn_shell(cmd, in: :receive, out: :stream)

    spawn(fn -> Proc.send_input(proc, "h\n") end)

    actual = Enum.into(proc.out, "")
    assert String.contains?(actual, "YOU DID IT!")
  end
end
