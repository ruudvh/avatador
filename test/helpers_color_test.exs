defmodule HelpersColorTest do
  use ExUnit.Case
  alias Avatador.Helpers.Color

  test "Valid color hex #RRGGBBAA" do
    assert Color.is_valid_color_hex?("#99CCEEFF") == true
  end

  test "Invalid color hex #RRGGBB_" do
     assert Color.is_valid_color_hex?("#99CCEEF") == false
  end

  test "Valid color hex #RRGGBB" do
    assert Color.is_valid_color_hex?("#99CCEE") == true
  end

  test "Invalid color hex #RGBA_" do
    assert Color.is_valid_color_hex?("#99CCE") == false
  end

  test "Valid color hex #RGBA" do
    assert Color.is_valid_color_hex?("#99CC") == true
  end

  test "Valid color hex #RGB" do
    assert Color.is_valid_color_hex?("#99C") == true
  end

  test "Invalid color hex #__" do
    assert Color.is_valid_color_hex?("#9C") == false
  end

  test "Invalid color hex #_" do
    assert Color.is_valid_color_hex?("#9") == false
  end

  test "Invalid color hex #RRGGBBAA_" do
    assert Color.is_valid_color_hex?("#99CCEEFFF") == false
  end

  test "Invalid color hex #ZZZZZZ" do
    assert Color.is_valid_color_hex?("#ZZZZZZ") == false
  end

  test "Hex #RRGGBBAA to rgba()" do
    color = "#99CCEECC"

    assert Color.hex_to_rgba(color) == %{r: 153, g: 204, b: 238, a: 0.8}
  end

  test "Hex #RRGGBB to rgba()" do
    color = "#99CCEE"

    assert Color.hex_to_rgba(color) == %{r: 153, g: 204, b: 238, a: 1}
  end

  test "Hex #RGBA to rgba()" do
    color = "#99CC"

    assert Color.hex_to_rgba(color) == %{r: 153, g: 153, b: 204, a: 0.8}
  end

  test "Hex #RGB to rgba()" do
    color = "#99C"

    assert Color.hex_to_rgba(color) == %{r: 153, g: 153, b: 204, a: 1}
  end

  test "Hex with lowercase #16a979 to rgba()" do
    color = "#16a979"

    assert Color.hex_to_rgba(color) == %{r: 22, g: 169, b: 121, a: 1}
  end
end
