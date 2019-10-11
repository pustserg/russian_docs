defmodule RussianDocs.InnTest do
  use ExUnit.Case
  doctest RussianDocs.Inn

  alias RussianDocs.Inn

  describe "validate" do
    test "String lenght is not 10 or 12" do
      assert Inn.validate("123456789") == {:error, :invalid_string_length}
      assert Inn.validate("12345678901") == {:error, :invalid_string_length}
      assert Inn.validate("a1") == {:error, :invalid_string_length}
    end

    test "Invalid control digit" do
      assert Inn.validate("644006053638") == {:error, :invalid_control_digit}
    end

    test "Valid private inn" do
      assert Inn.validate("644006053738") == {:ok, nil}
    end

    test "It should be valid for integer input" do
      assert Inn.validate(644_006_053_738) == {:ok, nil}
    end

    test "It should valid for formatted input" do
      assert Inn.validate("6440-060537-38") == {:ok, nil}
    end

    test "Valid corporate inn" do
      assert Inn.validate("3123011520") == {:ok, nil}
    end
  end

  describe "format" do
    test "it should not format invalid snils" do
      assert Inn.format("644006053739") == {:error, :invalid_inn}
      assert Inn.format(644_006_053_739) == {:error, :invalid_inn}
    end

    test "it should format valid string" do
      assert Inn.format("644006053738") == {:ok, "6440-060537-38"}
      assert Inn.format(644_006_053_738) == {:ok, "6440-060537-38"}
    end
  end
end
