defmodule Run do

  @filename "my-deck2.txt"

  def write() do
    { my_hand, _ } = Cards.create_deck
      |> Cards.shuffle
      |> Cards.deal(5)

    Cards.save(my_hand, @filename)
  end

  def write2 do
    hand_size = 5
    { my_hand, _ } = Cards.create_hand(hand_size)
    Cards.save(my_hand, @filename)
  end

  def read() do
    {status, binary} =  File.read(@filename)

    IO.puts "status from Cards.read/1 - #{status}"

    if status != :ok do
      raise "Could not read from file #{@filename}"
    end

    :erlang.binary_to_term(binary)
  end

end
