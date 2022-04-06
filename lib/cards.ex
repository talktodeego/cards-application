defmodule Cards do
  @moduledoc """
  Provides methods for creating and handling a deck of cards
  """

  @doc """
  Return a list of strings representing a deck of playing cards

  ## Examples

      iex> deck = Cards.createDeck

  """
  def createDeck do
    values = ["Ace", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Jack", "Queen", "King"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end
  end

  @doc """
  Shuffle all the deck into random sequence

  ## Example

      iex> deck = Cards.createDeck
      iex> Cards.shuffle(deck)

  """
  def shuffle(deck) do
    Enum.shuffle(deck)
  end


  @doc """
  Determines whether a deck contains a given card

  ## Examples

      iex> deck = Cards.createDeck
      iex> Cards.contains?(deck, "Ace of Spades")
      true

  """
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  @doc """
  Divides a deck into a hand and the remainder of the deck.
  The `hand_size` argument indicates how many cards should be in the hand.

  ## Examples

      iex> deck = Cards.createDeck
      iex> {hand, deck} = Cards.deal(deck, 1)
      iex> hand
      ["Ace of Spades"]
  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  @doc """
  Save the deck or hand.

  ## Examples

      iex> deck = Cards.createDeck
      iex> Cards.save(deck, 'my_deck')

  """
  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end


  @doc """
  Load the deck or hand.

  ## Examples

      iex> Cards.load('my_deck')
  """
  def load(filename) do
    case File.read(filename) do
      {:ok, binary} ->
        :erlang.binary_to_term(binary)
      {:error, _reason} ->
        "That file does not exist"
    end
  end

  @doc """
  Create a hand, shuffles and deal all at once.

  ## Examples

      iex> Cards.createHand(3)
  """
  def createHand(hand_size) do
    Cards.createDeck
    |> Cards.shuffle
    |> Cards.deal(hand_size)
  end
end
