defmodule Avatador.Helpers.List do
  require Integer

  @moduledoc """
  List Helpers
  """

  @doc """
  Turn a list of binary encoded hexadecimal into a 5x5 grid. Mirroring of
  each row is applied to create symmetry.
  """
  @doc since: "0.1.0"
  def integer_list_to_grid(list) do
    list
    |> Enum.chunk_every(3)
    |> Enum.flat_map(&mirror/1)
    |> Enum.with_index
  end

  @doc """
  Mirror a `List`.
  e.g. [1, 2, 3] -> [1, 2, 3, 2, 1]
  """
  @doc since: "0.1.0"
  def mirror(row) do
    len = Enum.count row
    reversed = Enum.reverse(row)

    case Integer.is_even(len) do
      true ->
        List.flatten [row | reversed]
      false ->
        List.flatten [row | tl(reversed)]
    end
  end

  @doc """
  Get item from `List` based on any `Integer`.
  """
  @doc since: "0.1.0"
  def get_by_integer(list, integer) when is_integer(integer) do
    index = rem(integer, Enum.count(list))
    Enum.at(list, index)
  end
end
