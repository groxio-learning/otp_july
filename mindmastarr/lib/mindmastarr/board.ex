defmodule Mindmastarr.Board do
  @random_solution Enum.take_random(1..8, 4)

  alias Mindmastarr.Score

  defstruct guesses: [], solution: []

  def new(answer \\ @random_solution) do
    %__MODULE__{solution: answer}
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
    |> Enum.join("\n")
  end

  def render_row(solution, [first, second, third, fourth] = guess) do
    "[#{first}][#{second}][#{third}][#{fourth}] | #{Score.new(guess, solution) |> Score.as_string()}"
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
