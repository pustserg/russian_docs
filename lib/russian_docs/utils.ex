defmodule RussianDocs.Utils do
  def stringify(input) when is_integer(input) do
    Integer.to_string(input)
  end

  def stringify(input) when is_binary(input) do
    String.replace(input, ~r/\D/, "")
  end
end
