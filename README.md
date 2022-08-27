![Avatador](assets/logo.png)

# Avatador
## Options
- `:background` The background color hex of the avatar, without the hash (#) e.g. `000000`.
- `:color` The text color hex of the avatar, without the hash (#) e.g. `FFFFFF`.
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

## Supports
- `:background` is hashed (md5) so that the same `:name` will receive the same `:background` color.
- Supported color formats include #rgb, #rgba, #rrggbbaa, and #rrggbbaa (thou make sure to omit the `#`-sign).

## Todo
- RTL support
- svg to png
  https://codepen.io/arcaelas-the-looper/pen/wvrqzvm
  https://stackoverflow.com/questions/11567668/svg-to-canvas-with-d3-js/23667012#23667012

## Installation
If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `avatador` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:avatador, "~> 0.1.0"}
  ]
end
```

## Development
- Run tests with `mix test`
- Create docs with `mix docs`
