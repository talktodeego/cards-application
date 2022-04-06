defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "createDeck makes 52 cards" do
    deck_lenght = length(Cards.createDeck)
    assert deck_lenght == 52
  end

  test "shuffling a deck randomizes it" do
    deck = Cards.createDeck
    refute deck == Cards.shuffle(deck)
  end

end
