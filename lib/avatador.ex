defmodule Avatador do
  @moduledoc """
  Avatador
  """
  @moduledoc since: "0.1.0"

  alias Avatador.Helpers
  alias Avatador.Helpers.{Color, List}

  defstruct(
    format: "SVG",
    background: "rgba(0,0,0,1)",
    background_rgba: %{r: 0, g: 0, b: 0, a: 1},
    color: "rgba(255,255,255,1)",
    color_rgba: %{r: 255, g: 255, b: 255, a: 1},
    name: "",
    is_rounded: false,
    rounded: 0.0,
    width: 500,
    height: 500,
    font_size: 250,
    font_family: "Montserrat",
    caps: 1,
    bold: true,
    text_style: "font-size:250.0px;line-height:1;color:rgba\(255,255,255,1\);font-family:Montserrat,sans-serif;",
    hash: nil,
    hash_integer: nil,
    hash_list: nil,
    grid: nil,
    pixels: nil
  )

  @doc """
  Create an avatar from a `Map` of options.
  Returns a `~s()` SVG.

  ## Examples

      # An avatar with background of "#962ED" and name "John Doe"
      iex> Avatador.avatar(%{background: "96C2ED", name: "John Doe"})

      # An avatar with a random background, name "John Doe", and width of "50px"
      iex> Avatador.avatar(%{name: "John Doe", width: "50"})

  ## Arguments

  - `:background` The background color of the avatar, without the hash (#) e.g. `000000`.
  - `:color` The text color of the avatar, without the hash (#) e.g. `FFFFFF`.
  - `:name` The name/username/email of the entity you want the avatar's initials to represent.
  - `:is_rounded` True or false, should avater be rounded? If `true` and no `rounded` value it assumes the width/height (fully rounded).
  - `:rounded` The px value of rounding, leave blank or `0` for no rounding.
  - `:width` The height of the avatar in pixels. If not provided assumes width=height or default value.
  - `:height` The width of the avatar in pixels. If not provided assumes width=height or default value.
  - `:font_size` The font size in pixels.
  - `:font_family` The name of the font family.
  - `:caps` Capitalization of the initials. 1 for uppercase, 2 for lowercase, 3 for leaving as provided.
  - `:bold` True or false, should text be bold?

  ## Defaults

      %{
        background: "#000000",
        color: "#FFFFFF",
        name: "",
        is_rounded: false,
        rounded: 0.0,
        width: 500.0,
        height: 500.0,
        font_size: 250.0,
        font_family: "Montserrat",
        caps: 1,
        bold: true,
      }

  """
  @doc since: "0.1.0"
  def avatar(assigns \\ %{}) do
    assigns
    |> sanatize_inputs
    |> create_hash_from_name
    |> verify_color
    |> verify_background
    |> verify_name_create_initials
    |> verify_size
    |> verify_rounded
    |> create_text_style
    |> render_avatar_svg
  end

  @doc """
  Create an identicon from a `Map` of options.
  Returns a `~s()` for SVG or a base64 encoded PNG.

  ## Examples

      # An identicon with background of "#962ED" and name "John Doe"
      iex> Avatador.identicon(%{background: "96C2ED", name: "John Doe"})

      # An identicon in PNG with a random background, name "John Doe", and width of "50px"
      iex> Avatador.identicon(%{format: "PNG", background: "96C2ED", name: "John Doe", width: "50"})

  ## Arguments

  - `:format` SVG or PNG output.
  - `:background` The background color of the avatar, without the hash (#) e.g. `000000`.
  - `:color` The text color of the avatar, without the hash (#) e.g. `FFFFFF`.
  - `:name` The name/username/email of the entity you want the avatar's initials to represent.
  - `:is_rounded` True or false, should avater be rounded? If `true` and no `rounded` value it assumes the width/height (fully rounded).
  - `:rounded` The px value of rounding, leave blank or `0` for no rounding.
  - `:width` The height of the avatar in pixels. If not provided assumes width=height or default value.
  - `:height` The width of the avatar in pixels. If not provided assumes width=height or default value.

  ## Defaults

      %{
        format: "SVG",
        background: "#000000",
        color: "#FFFFFF",
        name: "",
        is_rounded: false,
        rounded: 0.0,
        width: 500.0,
        height: 500.0,
      }

  """
  @doc since: "0.1.0"
  def identicon(assigns \\ %{}) do
    format = sanatize_format_input(Map.get(assigns, :format))
    case format do
      "PNG" ->
        assigns
        |> sanatize_inputs
        |> create_hash_from_name
        |> verify_color
        |> verify_background
        |> verify_size
        |> verify_rounded
        |> build_grid
        |> remove_odd_bytes
        |> calculate_pixels
        |> render_identicon_png

      _ ->
        assigns
        |> sanatize_inputs
        |> create_hash_from_name
        |> verify_color
        |> verify_background
        |> verify_size
        |> verify_rounded
        |> build_grid
        |> remove_odd_bytes
        |> calculate_pixels
        |> render_identicon_svg
    end
  end

  defp sanatize_format_input(format), do: format |> Helpers.to_string() |> String.upcase()

  defp sanatize_inputs(assigns) do
    # Floats
    rounded = Map.get(assigns, :rounded) |> Helpers.to_float()
    width = Map.get(assigns, :width) |> Helpers.to_float()
    height = Map.get(assigns, :height) |> Helpers.to_float()
    font_size = Map.get(assigns, :font_size) |> Helpers.to_float()

    # Integers
    caps = Map.get(assigns, :caps) |> Helpers.to_integer()

    # Booleans
    bold =Map.get(assigns, :bold) |>  Helpers.to_boolean()
    is_rounded = Map.get(assigns, :is_rounded) |> Helpers.to_boolean()

    # Strings
    background = Map.get(assigns, :background) |> Helpers.to_string()
    color = Map.get(assigns, :color) |> Helpers.to_string()
    name = Map.get(assigns, :name) |> Helpers.to_string()
    font_family = Map.get(assigns, :font_family) |> Helpers.to_string()

    %Avatador{
      background: "#" <> background,
      color: "#" <> color,
      name: name,
      is_rounded: is_rounded,
      rounded: rounded,
      width: width,
      height: height,
      font_size: font_size,
      font_family: font_family,
      caps: caps,
      bold: bold,
    }
  end

  defp create_hash_from_name(%Avatador{name: name} = avatador) do
    hash = Helpers.hash_value(name)
    hash_integer = Helpers.hash_to_integer(hash)
    hash_list  = Helpers.hash_to_list(hash)
    %Avatador{avatador | hash: hash, hash_integer: hash_integer, hash_list: hash_list}
  end

  defp verify_color(%Avatador{color: color} = avatador) do
    rgba = if Color.is_valid_color_hex?(color) do
      Color.hex_to_rgba(color)
    else
      # Default white
      %{r: 255, g: 255, b: 255, a: 1}
    end

    %Avatador{avatador | color: "rgba(#{rgba.r},#{rgba.g},#{rgba.b},#{rgba.a})", color_rgba: rgba}
  end

  defp verify_background(%Avatador{background: background} = avatador) do
    rgba = if Color.is_valid_color_hex?(background) do
      Color.hex_to_rgba(background)
    else
      # Default random
      [r, g, b | _] = avatador.hash_list
      %{r: r, g: g, b: b, a: 1}
    end

    %Avatador{avatador | background: "rgba(#{rgba.r},#{rgba.g},#{rgba.b},#{rgba.a})", background_rgba: rgba}
  end

  defp verify_name_create_initials(%Avatador{name: name} = avatador) do
    if String.length(name) >= 1 do
      initials =
        name
        |> Helpers.generate_initials()
        |> Helpers.maybe_capitalize(avatador.caps)

      %Avatador{avatador | name: initials}
    else
      # Default empty string
      %Avatador{avatador | name: ""}
    end
  end

  defp verify_size(%Avatador{width: 0.0, height: 0.0} = avatador), do: %Avatador{avatador | height: 500.0, width: 500.0}
  defp verify_size(%Avatador{width: 0.0, height: height} = avatador), do: %Avatador{avatador | height: height, width: height}
  defp verify_size(%Avatador{width: width, height: 0.0} = avatador), do: %Avatador{avatador | height: width, width: width}
  defp verify_size(%Avatador{} = avatador), do: avatador

  defp verify_rounded(%Avatador{is_rounded: true, rounded: rounded} = avatador) when rounded > 0.0, do: avatador
  defp verify_rounded(%Avatador{rounded: rounded} = avatador) when rounded > 0.0, do: %Avatador{avatador | is_rounded: true}
  defp verify_rounded(%Avatador{is_rounded: true} = avatador), do: %Avatador{avatador | rounded: max(avatador.width, avatador.height)}
  defp verify_rounded(%Avatador{} = avatador), do: %Avatador{avatador | rounded: 0.0, is_rounded: false}

  ###
  ##
  ## Avatar Specific
  ##
  ###

  defp create_text_style(%Avatador{bold: bold, font_size: font_size, font_family: font_family} = avatador) do
    width = avatador.width
    height = avatador.height
    color = avatador.color

    font_size_style = if font_size == 0.0, do: "font-size:#{min(width, height) / 2}px;", else: "font-size:#{font_size}px;"
    font_line_height_style = "line-height:1;"
    font_color_style = "color:#{color};"
    font_bolt_style = if bold == true, do: "font-weight:700;", else: ""
    font_family_style = if String.length(font_family) == 0, do: "font-family:Montserrat,sans-serif;", else: "font-family:#{font_family},sans-serif;"

    text_style = "#{font_size_style}#{font_line_height_style}#{font_color_style}#{font_bolt_style}#{font_family_style}"
    %Avatador{avatador | text_style: text_style}
  end

  defp render_avatar_svg(%Avatador{name: name, background: background, width: width, height: height, rounded: rounded, color: color, text_style: text_style}) do
    ~s(<svg width="#{width}px" height="#{height}px" viewBox="0 0 #{width} #{height}" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.0"><rect x="0" y="0" width="#{width}" height="#{height}" rx="#{rounded}" style="fill:#{background}" /><text x="50%" y="50%" dy=".1em" fill="#{color}" text-anchor="middle" dominant-baseline="middle" style="#{text_style}">#{name}</text></svg>)
  end

  ###
  ##
  ## Identicon Specific
  ## Modified from: https://github.com/rbishop/identicon
  ###

  # We remove the head of the hexadecimal hash list because we only need fifteen
  # bytes to generate the left side and center of the grid
  defp build_grid(%Avatador{hash_list: [_ | hash_list]} = avatador) do
    grid = List.integer_list_to_grid(hash_list)
    %Avatador{avatador | grid: grid}
  end

  defp remove_odd_bytes(%Avatador{grid: grid} = avatador) do
    grid = Enum.filter grid, fn({code, _index}) ->
      rem(code, 2) == 0
    end

    %Avatador{avatador | grid: grid}
  end

  defp calculate_pixels(%Avatador{grid: grid, width: width, height: height} = avatador) do
    width = trunc(width / 5)
    height = trunc(height / 5)

    pixels = Enum.map(grid, fn({_code, index}) ->
      horizontal = rem(index, 5) * width
      vertical = div(index, 5) * height

      top_left = {horizontal, vertical}
      bottom_right = {horizontal + width, vertical + height}

      {top_left, bottom_right}
    end)

    %Avatador{avatador | pixels: pixels}
  end

  defp render_identicon_svg(%Avatador{pixels: pixels, background: background, width: width, height: height, rounded: rounded}) do
    # svg_background = ~s(<rect fill="#{avatador.background}" x="0" y="0" width="#{avatador.width}" height="#{avatador.height}" />)
    svg_blocks = Enum.reduce(pixels, "", fn({{x1, y1} = _start, {x2, y2} = _stop}, svg_blocks) ->
      svg_blocks <> ~s(<rect fill="#{background}" x="#{x1}" y="#{y1}" width="#{x2 - x1}" height="#{y2 - y1}"/>)
    end)

    ~s(<svg style="border-radius:#{rounded}px;" width="#{width}px" height="#{height}px" viewBox="0 0 #{width} #{height}" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.0">#{svg_blocks}</svg>)
  end

  defp render_identicon_png(%Avatador{background_rgba: background_rgba, pixels: pixels, width: width, height: height}) do
    # Create image object. `trunc` to convert floats to integers.
    image = :egd.create(trunc(width), trunc(height))

    # Set color object
    %{r: r, g: g, b: b, a: _a} = background_rgba
    fill = :egd.color({r, g, b})

    # Create a rectangle for each "pixel"
    Enum.each(pixels, fn({start, stop}) ->
      :egd.filledRectangle(image, start, stop, fill)
    end)

    # Render image to base64
    :egd.render(image, :png) |> Base.encode64
  end

end
