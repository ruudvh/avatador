defmodule Avatador.Helpers do
  @moduledoc """
  Helper functions for Avatador.
  """
  @moduledoc since: "0.1.0"

  @doc """
  Convert a `value` to `String`.

  Only converts `Float`, `Integer`, and `Binary` values.
  `nil` returns `nil`, all else returns `""` (empty string).
  """
  @doc since: "0.1.0"
  def to_string(value) do
    cond do
      is_float(value) -> Float.to_string(value)
      is_integer(value) -> Integer.to_string(value)
      is_binary(value) -> value
      true -> ""
    end
  end

  @doc """
  Convert a `value` to `Float`.

  Only converts `Float`, `Integer`, and `Binary` values.
  All else returns `0.0`.
  """
  @doc since: "0.1.0"
  def to_float(value) do
    cond do
      is_float(value) -> value
      is_integer(value) -> value / 1
      is_binary(value) -> binary_to_float(value)
      true -> 0.0
    end
  end

  defp binary_to_float(value) do
    case Float.parse(value) do
      {int, ""} -> int
      :error -> 0.0
    end
  end

  @doc """
  Convert a `value` to `Integer`.

  Only converts `Float`, `Integer`, and `Binary` values.
  All else returns `0`.
  """
  @doc since: "0.1.0"
  def to_integer(value) do
    cond do
      is_float(value) -> trunc(value)
      is_integer(value) -> value
      is_binary(value) -> binary_to_integer(value)
      true -> 0
    end
  end

  defp binary_to_integer(value) do
    case Integer.parse(value) do
      {int, ""} -> int
      :error -> 0
    end
  end

  @doc """
  Convert a `value` to `Boolean`.

  `"true"`, `true`, `"1"`, `1` returns `true`
  `"false"`, `false`, `"0"`, `0` returns `false`
  """
  @doc since: "0.1.0"
  def to_boolean("true"), do: true
  def to_boolean("false"), do: false
  def to_boolean(true), do: true
  def to_boolean(false), do: false
  def to_boolean("1"), do: true
  def to_boolean("0"), do: false
  def to_boolean(1), do: true
  def to_boolean(0), do: false
  def to_boolean(_), do: false

  @doc """
  Checks if given `color` is valid color hex i.e. `#FFFFFF`.
  """
  @doc since: "0.1.0"
  def is_valid_color_format?(color) do
    if !is_nil(color) and
       is_binary(color) and
       (String.length(color) == 4 or String.length(color) == 5 or String.length(color) == 7 or String.length(color) == 9) and
       is_valid_hex_format?(color), do: true, else: false
  end

  defp is_valid_hex_format?(hex) do
    # https://regex101.com/r/RS3uAs/2
    Regex.match?(~r/#[a-f\d]{3}(?:[a-f\d]?|(?:[a-f\d]{3}(?:[a-f\d]{2})?)?)\b/i, hex)
  end

  @doc """
  Get item from `list[]` based on a hashed `value`.
  """
  @doc since: "0.1.0"
  def hashed_from_list(list, value) do

    hash_key =
      :crypto.hash(:sha, value)
      |> binary_part(0, 6)
      |> :crypto.bytes_to_integer()
      |> rem(Enum.count(list))

    Enum.at(list, hash_key)
  end

  @doc """
  Generate the initials for a `String`.
  """
  @doc since: "0.1.0"
  def generate_initials(string) when is_binary(string) do
    word_array = String.split(string)

    if length(word_array) == 1 do
      List.first(word_array)
      |> String.slice(0..1)
    else
      initial1 = String.first(List.first(word_array))
      initial2 = String.first(List.last(word_array))
      initial1 <> initial2
    end
  end

  @doc """
  Capitalize a `String` based on provided `cap_option`
  - 1 for all uppercase
  - 2 for all lowercase
  - 3 for leaving such as provided
  """
  @doc since: "0.1.0"
  def maybe_capitalize(string, 1) when is_binary(string), do: String.upcase(string)
  def maybe_capitalize(string, 2) when is_binary(string), do: String.downcase(string)
  def maybe_capitalize(string, 3) when is_binary(string), do: string
  def maybe_capitalize(string, _) when is_binary(string), do: String.upcase(string)

end
