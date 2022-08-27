defmodule Avatador do
  @moduledoc """
  Avatador
  """
  @moduledoc since: "0.1.0"

  alias Avatador.Helpers, as: Helpers

  @random_colors ["#E284B3", "#FFED8B",  "#681313", "#F3C1C6",  "#735372",  "#009975", "#FFBD39", "#B1E8ED", "#52437B", "#F76262", "#216583", "#293462", "#DD9D52", "#936B93", "#6DD38D", "#888888", "#6F8190", "#BCA0F0", "#AAF4DD", "#96C2ED", "#3593CE", "#5EE2CD", "#96366E", "#E38080"];
  @defaults %{
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
    text_style: "font-size:250.0px;line-height:1;color:#FFFFFF;font-family:Montserrat,sans-serif;" }

  @doc """
  Create a SVG from a `Map`.

  Returns `~s()`.

  ## Examples

      iex> Avatador.svg(%{background: "96C2ED", name: "John Cena"})
      ~s(<svg width="500.0px" height="500.0px" viewBox="0 0 500.0 500.0" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.0"><rect x="0" y="0" width="500.0" height="500.0" rx="0.0" style="fill:#96C2ED" /><text x="50%" y="50%" dy=".1em" fill="#FFFFFF" text-anchor="middle" dominant-baseline="middle" style="font-size:250.0px;line-height:1;color:#FFFFFF;font-family:Montserrat,sans-serif;">JC</text></svg>)

      iex> Avatador.svg(%{background: "96C2ED", name: "John Cena", width: "50"})
      ~s(<svg width="50.0px" height="50.0px" viewBox="0 0 50.0 50.0" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.0"><rect x="0" y="0" width="50.0" height="50.0" rx="0.0" style="fill:#96C2ED" /><text x="50%" y="50%" dy=".1em" fill="#FFFFFF" text-anchor="middle" dominant-baseline="middle" style="font-size:25.0px;line-height:1;color:#FFFFFF;font-family:Montserrat,sans-serif;">JC</text></svg>)

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
  def svg(assigns \\ %{}) do

    ints = %{
      background: "",
      color: "",
      name: "",
      is_rounded: "",
      rounded: "",
      width: "",
      height: "",
      font_size: "",
      font_family: "",
      caps: "",
      bold: ""}

    assigns = Map.merge(ints, assigns)

    assigns
    |> sanatize_inputs()
    |> verify_color()
    |> verify_background()
    |> verify_name_create_initials()
    |> verify_size()
    |> verify_rounded()
    |> create_text_style()
    |> create_svg()
  end

  defp create_svg(assigns) do
    ~s(<svg width="#{assigns.width}px" height="#{assigns.height}px" viewBox="0 0 #{assigns.width} #{assigns.height}" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.0"><rect x="0" y="0" width="#{assigns.width}" height="#{assigns.height}" rx="#{assigns.rounded}" style="fill:#{assigns.background}" /><text x="50%" y="50%" dy=".1em" fill="#{assigns.color}" text-anchor="middle" dominant-baseline="middle" style="#{assigns.text_style}">#{assigns.name}</text></svg>)
  end

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

    assigns
    |> Map.put(:background, background)
    |> Map.put(:color, color)
    |> Map.put(:name, name)
    |> Map.put(:is_rounded, is_rounded)
    |> Map.put(:rounded, rounded)
    |> Map.put(:width, width)
    |> Map.put(:height, height)
    |> Map.put(:font_size, font_size)
    |> Map.put(:caps, caps)
    |> Map.put(:bold, bold)
  end

  defp verify_color(assigns) do
    color = Map.get(assigns, :color)

    if Helpers.is_valid_color_format?("#" <> color) do
      Map.put(assigns, :color, "#" <> color)
    else
      Map.put(assigns, :color, @defaults.color)
    end
  end

  defp verify_background(assigns) do
    name = Map.get(assigns, :name)
    background = Map.get(assigns, :background)

    if Helpers.is_valid_color_format?("#" <> background) do
      Map.put(assigns, :background, "#" <> background)
    else
      Map.put(assigns, :background, Helpers.hashed_from_list(@random_colors, name))
    end
  end

  defp verify_name_create_initials(assigns) do
    caps = Map.get(assigns, :caps)
    name = Map.get(assigns, :name)

    if String.length(name) >= 1 do
      initials =
        name
        |> Helpers.generate_initials()
        |> Helpers.maybe_capitalize(caps)

      Map.put(assigns, :name, initials)
    else
      Map.put(assigns, :name, @defaults.name)
    end
  end

  defp verify_size(assigns) do
    width = Map.get(assigns, :width)
    height = Map.get(assigns, :height)

    case [width, height] do
      [0.0, 0.0] ->
        assigns
        |> Map.put(:width, @defaults.width)
        |> Map.put(:height, @defaults.height)

      [0.0, height] ->
        assigns
        |> Map.put(:width, height)
        |> Map.put(:height, height)

      [width, 0.0] ->
        assigns
        |> Map.put(:width, width)
        |> Map.put(:height, width)

      [width, height] ->
        assigns
        |> Map.put(:width, width)
        |> Map.put(:height, height)
    end
  end

  defp verify_rounded(assigns) do
    width = Map.get(assigns, :width)
    height = Map.get(assigns, :height)
    rounded = Map.get(assigns, :rounded)
    is_rounded = Map.get(assigns, :is_rounded)

    # If no value provided we will assume fully rounded (i.e. same px as width/height)
    cond do
      is_rounded and rounded > 0.0 -> assigns
      rounded > 0.0 -> Map.put(assigns, :is_rounded, true)
      is_rounded -> Map.put(assigns, :rounded, min(width, height))
      true -> Map.put(assigns, :rounded, 0.0) |> Map.put(:is_rounded, false)
    end
  end

  defp create_text_style(assigns) do
    width = Map.get(assigns, :width)
    height = Map.get(assigns, :height)
    color = Map.get(assigns, :color)
    bold = Map.get(assigns, :bold)
    font_size = Map.get(assigns, :font_size)
    font_family = Map.get(assigns, :font_family)

    font_size_style = if font_size != 0.0, do: "font-size:#{font_size}px;", else: "font-size:#{min(width, height) / 2}px;"
    font_line_height_style = "line-height:1;"
    font_color_style = "color:#{color};"
    font_bolt_style = if bold == true, do: "font-weight:700;", else: ""
    font_family_style = if font_family != "", do: "font-family:#{font_family},sans-serif;", else: "font-family:Montserrat,sans-serif;"

    text_style = "#{font_size_style}#{font_line_height_style}#{font_color_style}#{font_bolt_style}#{font_family_style}"
    Map.put(assigns, :text_style, text_style)
  end
end
