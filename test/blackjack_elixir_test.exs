defmodule BlackjackElixirTest do
  use ExUnit.Case, async: false
  doctest BlackjackElixir
  alias Porcelain.Process, as: Proc

  setup_all do
    Porcelain.reinit(Porcelain.Driver.Basic)
  end

 # test "make builds the application" do
 #   assert {_, 0} = System.cmd("make", ["blackjack"])
 #   assert {"hello\n", 0} = System.cmd(Path.join(File.cwd!, "blackjack_elixir"), [])
 # end

  test "I can hit or stay" do
    cmd = Path.join(File.cwd!, "blackjack_elixir")
    proc = Porcelain.spawn_shell(cmd, in: :receive, out: :stream)

    pid = spawn(fn ->
      Proc.send_input(proc, "h\n")
    end)

    actual = Enum.into(proc.out, "")
    assert String.contains?(actual, "YOU DID IT!")
  end
end
