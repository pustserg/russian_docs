defmodule RussianDocs.SnilsTest do
  use ExUnit.Case
  doctest RussianDocs.Snils

  alias RussianDocs.Snils

  describe "validate" do
    test "String lenght is not 11" do
      assert Snils.validate("1234567890") == {:error, :invalid_string_length}
      assert Snils.validate("123456789012") == {:error, :invalid_string_length}
      assert Snils.validate("a1") == {:error, :invalid_string_length}
    end

    test "Invalid control digit" do
      assert Snils.validate("96311715800") == {:error, :invalid_control_digit}
    end

    test "Valid snils" do
      assert Snils.validate("96311715808") == {:ok, nil}
    end

    test "It should be valid for integer input" do
      assert Snils.validate(96311715808) == {:ok, nil}
    end

    test "It should valid for formatted input" do
      assert Snils.validate("963-117-158 08") == {:ok, nil}
    end
  end

  describe "format" do
    test "it should not format invalid snils" do
      assert Snils.format("96311715800") == {:error, :invalid_snils}
      assert Snils.format(96311715800) == {:error, :invalid_snils}
    end

    test "it should format valid string" do
      assert Snils.format("96311715808") == {:ok, "963-117-158 08"}
      assert Snils.format(96311715808) == {:ok, "963-117-158 08"}
    end
  end
end
