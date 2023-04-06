defmodule EmmausTest do
  use ExUnit.Case
  doctest Emmaus

  test "greets the world" do
    assert Emmaus.hello() == :world
  end
end
