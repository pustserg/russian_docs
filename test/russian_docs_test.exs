defmodule RussianDocsTest do
  use ExUnit.Case
  doctest RussianDocs

  test "greets the world" do
    assert RussianDocs.hello() == :world
  end
end
