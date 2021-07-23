defmodule Mindmastarr.Server do
  use GenServer

  alias Mindmastarr.Board

  def move(game, guess) do
    GenServer.call(game, {:move, guess}) |> IO.puts()
  end

  def start_link(name) do
    GenServer.start_link(__MODULE__, name, name: name)
  end

  def child_spec(name) do
    %{id: name, start: {__MODULE__, :start_link, [name]}}
  end

  def init(_name) do
    {:ok, Board.new()}
  end

  def handle_call({:move, guess}, _from, board) do
    board = Board.add_move(board, guess)
    {:reply, Board.as_string(board), board}
  end
end
