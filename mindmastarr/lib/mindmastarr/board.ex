defmodule Mindmastarr.Board do
  @test_solution [1, 6, 7, 3]

  defstruct guesses: [], solution: @test_solution

  def new() do
    %__MODULE__{}
  end

  def add_move(board, move) do
    %{board | guesses: [move | board.guesses]}
  end

end
