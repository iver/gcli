defmodule GcliTest do
  use ExUnit.Case
  doctest Gcli

  test "greets the world" do
    assert Gcli.hello() == :world
  end
end
