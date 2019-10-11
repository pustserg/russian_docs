defmodule RussianDocs.Inn do
  alias RussianDocs.Utils

  @corporate_coeff_list [2, 4, 10, 3, 5, 9, 4, 6, 8]
  @private_first_coeff_list [7, 2, 4, 10, 3, 5, 9, 4, 6, 8]
  @private_second_coeff_lsit [3, 7, 2, 4, 10, 3, 5, 9, 4, 6, 8]

  @moduledoc """
  Module for Inn
  """

  @doc """
  Format inn to pretty string
  """
  def format(input) do
    string_input = Utils.stringify(input)

    case validate(string_input) do
      {:error, _} -> {:error, :invalid_inn}
      {:ok, _} -> {:ok, format_inn(string_input)}
    end
  end

  @doc """
  Validates if string is a valid inn number
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
    String.length(input) != 10 && String.length(input) != 12
  end

  def invalid_number?(input) do
    case String.length(input) do
      10 -> invalid_corporate_inn?(input)
      12 -> invalid_private_inn?(input)
    end
  end

  defp invalid_corporate_inn?(input) do
    {base, control} = String.split_at(input, 9)
    check_base_control(base, control, @corporate_coeff_list)
  end

  defp invalid_private_inn?(input) do
    {base, controls} = String.split_at input, 10
    {second_base, _} = String.split_at input, 11
    {first_control, second_control} = {String.at(controls, 0), String.at(controls, 1)}
    invalid_first_control = check_base_control(base, first_control, @private_first_coeff_list)
    invalid_second_control = check_base_control(second_base, second_control, @private_second_coeff_lsit)

    invalid_first_control || invalid_second_control
  end

  defp check_base_control(base, control, coeff_list) do
    sum = base
          |> String.split("")
          |> Enum.slice(1..-2)
          |> Enum.map(&String.to_integer(&1))
          |> Enum.zip(coeff_list)
          |> Enum.reduce(0 , fn {el1, el2}, acc -> (el1 * el2) + acc end)
          |> rem(11)
          |> rem(10)
    sum != String.to_integer(control)
  end

  defp format_inn(str) do
    String.slice(str, 0..3) <> "-" <> String.slice(str, 4..9) <> "-" <> String.slice(str, 10..-1)
  end
end
