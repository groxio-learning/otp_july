defmodule Mindmastarr.Score do
  @total_opts_per_guess 4

  defstruct red: 0, white: 0, black: 0

  def new(guess, solution) do
    red = calc_red(guess, solution)
    black = calc_black(guess, solution)
    white = calc_white(red, black)
    %__MODULE__{red: red, black: black, white: white}
  end

  def as_string(score) do
    (List.duplicate("R", score.red) ++
       List.duplicate("W", score.white) ++ List.duplicate(".", score.black))
    |> Enum.join()
  end

  defp calc_red(guess, solution) do
    guess
    |> Enum.zip(solution)
    |> Enum.filter(fn {x, y} -> x == y end)
    |> Enum.count()
  end

  defp calc_black(guess, solution) do
    Enum.count(guess -- solution)
  end

  defp calc_white(red, black) do
    @total_opts_per_guess - red - black
  end
end
