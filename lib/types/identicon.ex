defmodule Avatador.Identicon do
  alias Avatador.Identicon, as: Identicon
  alias Avatador.Helpers.List

  @moduledoc """
  Identicon Creator

  This module generates GitHub-like, symmetrical identicons.

  Given an input of a string you will receive a `~s()` SVG or
  a base64 encoded PNG for that string.

  Library is modified version from: https://github.com/rbishop/identicon
  """
  @moduledoc since: "0.1.0"

  defstruct hex: nil, color: nil, grid: nil, pixels: nil, avatador: nil

  def render_svg(%Avatador{} = avatador) do
    avatador
    |> prelim_steps
    |> svg_image
  end

  def render_png(%Avatador{} = avatador) do
    avatador
    |> prelim_steps
    |> png_image
  end

  defp prelim_steps(%Avatador{} = avatador) do
    avatador
    |> set_avatador
    |> extract_color
    |> build_grid
    |> remove_odd_bytes
    |> calculate_pixels
  end

  defp set_avatador(%Avatador{} = avatador) do
    hex = avatador.hash_list
    %Identicon{hex: hex, avatador: avatador}
  end

  defp extract_color(%Identicon{hex: [r, g, b | _]} = identicon) do
    %Identicon{identicon | color: {r, g, b}}
  end

  # We remove the head of the hexadecimal list because we only need fifteen
  # bytes to generate the left side and center of the grid
  defp build_grid(%Identicon{hex: [_ | hex]} = identicon) do
    grid = List.integer_list_to_grid(hex)
    %Identicon{identicon | grid: grid}
  end

  defp remove_odd_bytes(%Identicon{grid: grid} = identicon) do
    grid = Enum.filter grid, fn({code, _index}) ->
      rem(code, 2) == 0
    end

    %Identicon{identicon | grid: grid}
  end

  defp calculate_pixels(%Identicon{grid: grid} = identicon) do
    width = trunc(identicon.avatador.width / 5)
    height = trunc(identicon.avatador.height / 5)

    pixels = Enum.map(grid, fn({_code, index}) ->
      horizontal = rem(index, 5) * width
      vertical = div(index, 5) * height

      top_left = {horizontal, vertical}
      bottom_right = {horizontal + width, vertical + height}

      {top_left, bottom_right}
    end)

    %Identicon{identicon | pixels: pixels}
  end

  defp svg_image(%Identicon{pixels: pixels} = identicon) do
    avatador = identicon.avatador

    # svg_background = ~s(<rect fill="#{avatador.background}" x="0" y="0" width="#{avatador.width}" height="#{avatador.height}" />)
    svg_blocks = Enum.reduce(pixels, "", fn({{x1, y1} = _start, {x2, y2} = _stop}, svg_blocks) ->
      svg_blocks <> ~s(<rect fill="#{avatador.background}" x="#{x1}" y="#{y1}" width="#{x2 - x1}" height="#{y2 - y1}"/>)
    end)

    ~s(<svg width="#{avatador.width}px" height="#{avatador.height}px" viewBox="0 0 #{avatador.width} #{avatador.height}" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.0">#{svg_blocks}</svg>)
  end

  defp png_image(%Identicon{color: color, pixels: pixels} = identicon) do
    avatador = identicon.avatador

    image = :egd.create(avatador.width, avatador.height)
    fill = :egd.color(color)

    Enum.each(pixels, fn({start, stop}) ->
      :egd.filledRectangle(image, start, stop, fill)
    end)

    :egd.render(image, :png) |> Base.encode64
  end
end
