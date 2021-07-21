defmodule Findarr.Counter do
  def new(initial), do: String.to_integer(initial)

  def inc(original), do: original + 1

  def dec(original), do: original - 1

  def message(count), do: "Current count is: #{count}"
end
