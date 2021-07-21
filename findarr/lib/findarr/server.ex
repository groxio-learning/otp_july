defmodule Findarr.Server do
  use GenServer

  alias Findarr.Counter

  def boom(counter \\ __MODULE__) do
    send(counter, :boom)
  end

  def dec(counter \\ __MODULE__) do
    GenServer.cast(counter, :dec)
  end

  def inc(counter \\ __MODULE__) do
    GenServer.cast(counter, :inc)
  end

  def status(counter \\ __MODULE__) do
    GenServer.call(counter, :status)
  end

  def start_link(initial) do
    GenServer.start_link(__MODULE__, initial, name: __MODULE__)
  end

  def init(initial) do
    IO.inspect("Starting with #{initial}")
    {:ok, Counter.new(initial)}
  end

  def handle_cast(:inc, count) do
    {:noreply, Counter.inc(count)}
  end

  def handle_cast(:dec, count) do
    {:noreply, Counter.dec(count)}
  end

  def handle_call(:status, _from, count) do
    {:reply, Counter.message(count), count}
  end

  def handle_info(:boom, count) do
    raise "Walk the plank!"
    {:noreply, count}
  end
end
