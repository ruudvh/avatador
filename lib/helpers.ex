defmodule Avatador.Helpers do
  require Integer

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
  def to_string(value) when is_float(value), do: Float.to_string(value)
  def to_string(value) when is_integer(value), do: Integer.to_string(value)
  def to_string(value) when is_binary(value), do: value
  def to_string(_), do: ""

  @doc """
  Convert a `value` to `Float`.

  Only converts `Float`, `Integer`, and `Binary` values.
  All else returns `0.0`.
  """
  @doc since: "0.1.0"
  def to_float(value) when is_float(value), do: value
  def to_float(value) when is_integer(value), do: value / 1
  def to_float(value) when is_binary(value), do: binary_to_float(value)
  def to_float(_), do: 0.0

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
  def to_integer(value) when is_float(value), do: trunc(value)
  def to_integer(value) when is_integer(value), do: value
  def to_integer(value) when is_binary(value), do: binary_to_integer(value)
  def to_integer(_), do: 0

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
  Hash a `string`.
  """
  @doc since: "0.1.0"
  def hash_value(string), do: :crypto.hash(:md5, string)

  @doc """
  Convert a `hash` to `Integer`.
  """
  @doc since: "0.1.0"
  def hash_to_integer(hash), do: hash |> :crypto.bytes_to_integer()

  @doc """
  Convert a `hash` to `List`.
  """
  @doc since: "0.1.0"
  def hash_to_list(hash), do: hash |> :binary.bin_to_list()

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
