![Avatador](assets/logo.png) ![Avatador](logo.png)

# Avatador
[Homepage](https://www.avatador.io) | [Docs](https://hexdocs.pm/avatador) | [Github](https://github.com/ruudvh/avatador)

Super simple avatar generator in Elixir.

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
- Simple cache: `:background` is hashed so that the same `:name` will receive the same `:background` color.
- Alpha colors: Supported color formats include #rgb, #rgba, #rrggbbaa, and #rrggbbaa (thou make sure to omit the `#`-sign).

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
- Questions, tips, code fixes, overhauls, and other contributions are very much welcome! Please submit an [issue](https://github.com/ruudvh/avatador/issues) or a [pull request](https://github.com/ruudvh/avatador/pulls).
- Run tests with `mix test`
- Create docs with `mix docs`

