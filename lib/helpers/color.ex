defmodule Avatador.Helpers.Color do
  @moduledoc """
  Color Helpers
  """

  @doc """
  Checks if given `color` is valid color hex i.e. `#FFFFFF`.
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

end
