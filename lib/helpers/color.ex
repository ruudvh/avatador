defmodule Avatador.Helpers.Color do
  @moduledoc """
    Color Helpers
  """

  @doc """
    Checks if given `color` is a valid color hex i.e. `#FFFFFF`.
  """
  @doc since: "0.1.0"
  def is_valid_color_hex?(color) do
    if !is_nil(color) and
       is_binary(color) and
       (String.length(color) == 4 or String.length(color) == 5 or String.length(color) == 7 or String.length(color) == 9) and
       is_valid_color_hex_format?(color), do: true, else: false
  end

  defp is_valid_color_hex_format?(hex) do
    # https://regex101.com/r/RS3uAs/2
    Regex.match?(~r/#[a-f\d]{3}(?:[a-f\d]?|(?:[a-f\d]{3}(?:[a-f\d]{2})?)?)\b/i, hex)
  end

  @doc """
    Convert Hex to RGB
    Returns a `Map`; `%{r: dec_red, g: dec_green, b: dec_blue, a: dec_alpha}`
    https://github.com/barakyo/color_utils
  """
  def hex_to_rgba(<<"#", hex::binary>>) do
    hex_to_rgba(String.upcase(hex)) # upcase hex value for the lookup at hex_to_decimal
  end

  # RRGGBBAA
  def hex_to_rgba(<<hex_red::binary-size(2), hex_green::binary-size(2), hex_blue::binary-size(2), hex_alpha::binary-size(2)>>) do
    %{
      r: hex_to_decimal(hex_red),
      g: hex_to_decimal(hex_green),
      b: hex_to_decimal(hex_blue),
      a: Float.round(hex_to_decimal(hex_alpha) / 255, 2),
    }
  end

  # RRGGBB
  def hex_to_rgba(<<hex_red::binary-size(2), hex_green::binary-size(2), hex_blue::binary-size(2)>>) do
    %{
      r: hex_to_decimal(hex_red),
      g: hex_to_decimal(hex_green),
      b: hex_to_decimal(hex_blue),
      a: 1,
    }
  end

  # RGBA
  def hex_to_rgba(<<hex_red::binary-size(1), hex_green::binary-size(1), hex_blue::binary-size(1), hex_alpha::binary-size(1)>>) do
    %{
      r: hex_to_decimal(hex_red <> hex_red),
      g: hex_to_decimal(hex_green <> hex_green),
      b: hex_to_decimal(hex_blue <> hex_blue),
      a: Float.round(hex_to_decimal(hex_alpha <> hex_alpha) / 255, 2),
    }
  end

  # RGB
  def hex_to_rgba(<<hex_red::binary-size(1), hex_green::binary-size(1), hex_blue::binary-size(1)>>) do
    %{
      r: hex_to_decimal(hex_red <> hex_red),
      g: hex_to_decimal(hex_green <> hex_green),
      b: hex_to_decimal(hex_blue <> hex_blue),
      a: 1,
    }
  end

  defp hex_to_decimal(hex_value) do

    hex_to_dec_symbols = %{
      "0" => 0,
      "1" => 1,
      "2" => 2,
      "3" => 3,
      "4" => 4,
      "5" => 5,
      "6" => 6,
      "7" => 7,
      "8" => 8,
      "9" => 9,
      "A" => 10,
      "B" => 11,
      "C" => 12,
      "D" => 13,
      "E" => 14,
      "F" => 15
    }

    # Reverse string so that indices are coupled with the correct value to power
    # C8 -> 8C
    hex_list = String.reverse(hex_value) |> String.codepoints() |> Enum.with_index()

    # 8C -> (8 * 16^0) + (C * 16^1)
    decimal_values = Enum.map(hex_list, fn({x, i} = _hex_tuple) ->
      Map.get(hex_to_dec_symbols, x) * :math.pow(16, i)
    end)
    Enum.reduce(decimal_values, 0, fn(x,y) -> trunc(x+y) end)
  end

end
