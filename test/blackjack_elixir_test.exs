defmodule BlackjackElixirTest do
  use ExUnit.Case
  doctest BlackjackElixir
  alias Porcelain.Process, as: Proc

  test "I can hit or stay" do
    cmd = Path.join(File.cwd!, "blackjack_elixir")
    proc = Porcelain.spawn_shell(cmd, in: :receive, out: :stream)

    spawn(fn -> Proc.send_input(proc, "h\n") end)

    out = Enum.into(proc.out, "")

    assert out == """
    Dealer:
    Player:
    """
  end
end
