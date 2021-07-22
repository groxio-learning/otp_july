defmodule Mindmastarr.Board do
  @test_solution [1, 6, 7, 3]

  alias Mindmastarr.Score

  defstruct guesses: [], solution: @test_solution

  def new() do
    %__MODULE__{}
  end

  def add_move(board, move) do
    %{board | guesses: [move | board.guesses]}
  end

  def as_string(board) do
    """
    #{render_guesses(board)}

    #{render_status(board)}
    """
  end

  def render_guesses(board) do
    Enum.map(board.guesses, &render_row(board.solution, &1))
  end

  def render_row(solution, [first, second, third, fourth] = guess) do
    "[#{first}][#{second}][#{third}][#{fourth}] | #{
      Score.new(guess, solution) |> Score.as_string()
    }"
  end

  def render_status(board) do
    "Status: #{status(board)}"
  end

  def status(%{solution: solution, guesses: [solution | _]}) do
    "win"
  end

  def status(%{guesses: guesses}) do
    case Enum.count(guesses) do
      10 -> "lose"
      _ -> "playing"
    end
  end
end
