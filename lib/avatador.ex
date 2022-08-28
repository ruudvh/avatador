defmodule Avatador do
  @moduledoc """
  Avatador
  """
  @moduledoc since: "0.1.0"

  alias Avatador.Helpers
  alias Avatador.Helpers.{Color, List}
  alias Avatador.Avatar
  alias Avatador.Identicon

  @random_colors ["#E284B3", "#FFED8B",  "#681313", "#F3C1C6",  "#735372",  "#009975", "#FFBD39", "#B1E8ED", "#52437B", "#F76262", "#216583", "#293462", "#DD9D52", "#936B93", "#6DD38D", "#888888", "#6F8190", "#BCA0F0", "#AAF4DD", "#96C2ED", "#3593CE", "#5EE2CD", "#96366E", "#E38080"];
  @defaults %{
    format: "SVG",
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
    bold: true
  }

  defstruct(
    format: @defaults.format,
    background: @defaults.background,
    color: @defaults.color,
    name: @defaults.name,
    hash: "",
    hash_integer: "",
    hash_list: "",
    is_rounded: @defaults.is_rounded,
    rounded: @defaults.rounded,
    width: @defaults.width,
    height: @defaults.height,
    font_size: @defaults.font_size,
    font_family: @defaults.font_family,
    caps: @defaults.caps,
    bold: @defaults.bold,
    text_style: "font-size:250.0px;line-height:1;color:#FFFFFF;font-family:Montserrat,sans-serif;"
  )

  @doc """
  Create an avatar or identicon from a `Map` of options.
  Returns a `~s()` SVG.

  ## Examples

      # Create an avatar SVG with `:background` "#96C2ED" and `name` "John Cena"
      iex> Avatador.avatar(%{background: "96C2ED", name: "John Cena"})
      ~s(<svg width="500.0px" height="500.0px" viewBox="0 0 500.0 500.0" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.0"><rect x="0" y="0" width="500.0" height="500.0" rx="0.0" style="fill:#96C2ED" /><text x="50%" y="50%" dy=".1em" fill="#FFFFFF" text-anchor="middle" dominant-baseline="middle" style="font-size:250.0px;line-height:1;color:#FFFFFF;font-family:Montserrat,sans-serif;">JC</text></svg>)

      # Create an avatar SVG with `:background` "#96C2ED", `name` "John Cena", and size "50px"
      iex> Avatador.avatar(%{background: "96C2ED", name: "John Cena", width: "50"})
      ~s(<svg width="50.0px" height="50.0px" viewBox="0 0 50.0 50.0" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.0"><rect x="0" y="0" width="50.0" height="50.0" rx="0.0" style="fill:#96C2ED" /><text x="50%" y="50%" dy=".1em" fill="#FFFFFF" text-anchor="middle" dominant-baseline="middle" style="font-size:25.0px;line-height:1;color:#FFFFFF;font-family:Montserrat,sans-serif;">JC</text></svg>)

      # Create an identicon SVG with `:background` "#96C2ED", `name` "John Cena"
      iex> Avatador.identicon(%{format: "SVG", background: "96C2ED", name: "John Cena"})
      ~s(<svg width="500.0px" height="500.0px" viewBox="0 0 500.0 500.0" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.0"><rect fill="#96C2ED" x="200" y="100" width="100" height="100"/><rect fill="#96C2ED" x="0" y="200" width="100" height="100"/><rect fill="#96C2ED" x="200" y="200" width="100" height="100"/><rect fill="#96C2ED" x="400" y="200" width="100" height="100"/><rect fill="#96C2ED" x="0" y="300" width="100" height="100"/><rect fill="#96C2ED" x="400" y="300" width="100" height="100"/><rect fill="#96C2ED" x="0" y="400" width="100" height="100"/><rect fill="#96C2ED" x="100" y="400" width="100" height="100"/><rect fill="#96C2ED" x="200" y="400" width="100" height="100"/><rect fill="#96C2ED" x="300" y="400" width="100" height="100"/><rect fill="#96C2ED" x="400" y="400" width="100" height="100"/></svg>)

      # Create an identicon SVG with `:background` "#96C2ED", `name` "John Cena", and size "50px"
      iex> Avatador.identicon(%{format: "SVG", background: "96C2ED", name: "John Cena", width: "50"})
      ~s(<svg width="50.0px" height="50.0px" viewBox="0 0 50.0 50.0" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.0"><rect fill="#96C2ED" x="20" y="10" width="10" height="10"/><rect fill="#96C2ED" x="0" y="20" width="10" height="10"/><rect fill="#96C2ED" x="20" y="20" width="10" height="10"/><rect fill="#96C2ED" x="40" y="20" width="10" height="10"/><rect fill="#96C2ED" x="0" y="30" width="10" height="10"/><rect fill="#96C2ED" x="40" y="30" width="10" height="10"/><rect fill="#96C2ED" x="0" y="40" width="10" height="10"/><rect fill="#96C2ED" x="10" y="40" width="10" height="10"/><rect fill="#96C2ED" x="20" y="40" width="10" height="10"/><rect fill="#96C2ED" x="30" y="40" width="10" height="10"/><rect fill="#96C2ED" x="40" y="40" width="10" height="10"/></svg>)

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
    |> prelim_steps
    |> Avatar.render_svg
  end

  def identicon(assigns \\ %{}) do
    format = sanatize_format_input(Map.get(assigns, :format))
    case format do
      "PNG" ->
        assigns
        |> prelim_steps
        |> Identicon.render_png

      _ ->
        assigns
        |> prelim_steps
        |> Identicon.render_svg
    end
  end

  defp prelim_steps(assigns) do
    assigns
    |> sanatize_inputs
    |> create_hash_from_name
    |> verify_color
    |> verify_background
    |> verify_name_create_initials
    |> verify_size
    |> verify_rounded
    |> create_text_style #only needed for SVG
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

    %Avatador{
      background: background,
      color: color,
      name: name,
      is_rounded: is_rounded,
      rounded: rounded,
      width: width,
      height: height,
      font_size: font_size,
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
    if Color.is_valid_color_hex?("#" <> color) do
      %Avatador{avatador | color: "#" <> color}
    else
      %Avatador{avatador | color: @defaults.color}
    end
  end

  defp verify_background(%Avatador{background: background} = avatador) do
    if Color.is_valid_color_hex?("#" <> background) do
      %Avatador{avatador | background: "#" <> background}
    else
      color = List.get_by_integer(@random_colors, avatador.hash_integer)
      %Avatador{avatador | background: color}
    end
  end

  defp verify_name_create_initials(%Avatador{name: name} = avatador) do
    if String.length(name) >= 1 do
      initials =
        name
        |> Helpers.generate_initials()
        |> Helpers.maybe_capitalize(avatador.caps)

      %Avatador{avatador | name: initials}
    else
      %Avatador{avatador | name: @defaults.name}
    end
  end

  defp verify_size(%Avatador{width: 0.0, height: 0.0} = avatador), do: %Avatador{avatador | height: @defaults.height, width: @defaults.width}
  defp verify_size(%Avatador{width: 0.0, height: height} = avatador), do: %Avatador{avatador | height: height, width: height}
  defp verify_size(%Avatador{width: width, height: 0.0} = avatador), do: %Avatador{avatador | height: width, width: width}
  defp verify_size(%Avatador{} = avatador), do: avatador

  defp verify_rounded(%Avatador{is_rounded: true, rounded: rounded} = avatador) when rounded > 0.0, do: avatador
  defp verify_rounded(%Avatador{rounded: rounded} = avatador) when rounded > 0.0, do: %Avatador{avatador | is_rounded: true}
  defp verify_rounded(%Avatador{is_rounded: true, width: width, height: height} = avatador), do: %Avatador{avatador | rounded: min(width, height)}
  defp verify_rounded(%Avatador{} = avatador), do: %Avatador{avatador | rounded: @defaults.rounded, is_rounded: @defaults.is_rounded}

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
end
