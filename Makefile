.PHONY: test

test: blackjack_elixir
	mix test

blackjack_elixir:
	mix escript.build
