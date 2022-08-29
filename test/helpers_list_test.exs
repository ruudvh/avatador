defmodule HelpersListTest do
  use ExUnit.Case
  alias Avatador.Helpers.List

  test "mirrored rows of 5 values are generated from a list" do
    list = [1, 2, 2, 4, 1, 2]
    grid = List.integer_list_to_grid(list)

    assert grid == [
            {1, 0}, {2, 1}, {2, 2}, {2, 3}, {1, 4},
            {4, 5}, {1, 6}, {2, 7}, {1, 8}, {4, 9}
           ]
  end

  test "mirroring with an odd number of columns" do
    row = [1, 2, 3]
    mirrored = List.mirror(row)

    assert mirrored == [1, 2, 3, 2, 1]
  end

  test "mirroring with an even number of columns" do
    row = [1, 2, 3, 4]
    mirrored = List.mirror(row)

    assert mirrored == [1, 2, 3, 4, 4, 3, 2, 1]
  end
end
