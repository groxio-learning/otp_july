defmodule Findarr.CounterTest do
  use ExUnit.Case

  alias Findarr.Counter

  describe "new/1" do
    test "should convert a string to an integer" do
      assert Counter.new("42") == 42
    end
  end
end
