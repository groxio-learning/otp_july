defmodule Findarr.Service do
  alias Findarr.Counter

  def start(raw_count) do
    # constructor
    initial_count = Counter.new(raw_count)
    # start server
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

  # input is server old state
  def listen(count) do
    receive do
      :inc ->
        # output is new state
        Counter.inc(count)

      :dec ->
        Counter.dec(count)

      {:status, from} ->
        send(from, Counter.message(count))
        count
    end
  end
end
