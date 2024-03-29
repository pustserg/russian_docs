defmodule RussianDocs.Snils do
  alias RussianDocs.Utils

  @moduledoc """
  Module for snils
  """

  @doc """
  Format snils to a pretty string as 000-000-000 00
  """

  def format(input) do
    string_input = Utils.stringify(input)

    case validate(string_input) do
      {:error, _} -> {:error, :invalid_snils}
      {:ok, _} -> {:ok, format_snils(string_input)}
    end
  end

  @doc """
  Validates if string is a valid snils number
  """
  def validate(input) do
    string_input = Utils.stringify(input)

    cond do
      invalid_length?(string_input) -> {:error, :invalid_string_length}
      invalid_number?(string_input) -> {:error, :invalid_control_digit}
      true -> {:ok, nil}
    end
  end

  defp invalid_length?(input) do
    String.length(input) != 11
  end

  defp invalid_number?(input) do
    {base, control} = input |> Utils.stringify() |> String.split_at(9)

    calc_control_number(base) != String.to_integer(control)
  end

  defp calc_control_number(base) do
    base
    |> String.split("")
    |> Enum.slice(1..-2)
    |> Enum.map(&String.to_integer(&1))
    |> Enum.with_index()
    |> Enum.reduce(0, fn {el, idx}, acc -> el * (9 - idx) + acc end)
    |> normalize
  end

  defp normalize(sum) do
    cond do
      sum > 101 -> normalize(rem(sum, 101))
      sum < 100 -> sum
      true -> 0
    end
  end

  defp format_snils(input) do
    "#{String.slice(input, 0..2)}-#{String.slice(input, 3..5)}-#{String.slice(input, 6..8)} #{
      String.slice(input, 9..10)
    }"
  end
end
