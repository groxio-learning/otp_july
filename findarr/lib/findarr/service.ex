defmodule Findarr.Service do
  alias Findarr.Counter

  def start(raw_count) do
    initial_count = Counter.new(raw_count)
    spawn(fn -> loop(initial_count) end)
  end

  def inc(counter) do
    send(counter, :inc)
  end

  def dec(counter) do
    send(counter, :dec)
  end

  def status(counter) do
    send(counter, {:status, self()})

    receive do
      m -> m
    end
  end

  def loop(count) do
    count
    |> listen
    |> loop
  end

  def listen(count) do
    receive do
      :inc ->
        Counter.inc(count)

      :dec ->
        Counter.dec(count)

      {:status, from} ->
        send(from, Counter.message(count))
        count
    end
  end
end
