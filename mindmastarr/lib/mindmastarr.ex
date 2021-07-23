defmodule Mindmastarr do

  alias Mindmastarr.Server
  @moduledoc """
  Documentation for `Mindmastarr`.
  """

  @doc """
    Start a new Mindmastarr game
  """
  def start_game(name) do
    DynamicSupervisor.start_child(Mindmastarr.DynamicSupervisarr, {Server, name})
  end

  @doc """
    Make a move (requires game name and an array of 4 numbers > 0 <= 8)
  """
  def make_move(game_name, move) do
    Server.move(game_name, move)
  end
end
