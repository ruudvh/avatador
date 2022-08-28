defmodule Avatador.Avatar do
  @moduledoc """
  Avatar Creator
  """
  @moduledoc since: "0.1.0"

  def render_svg(%Avatador{} = avatador) do
    ~s(<svg width="#{avatador.width}px" height="#{avatador.height}px" viewBox="0 0 #{avatador.width} #{avatador.height}" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.0"><rect x="0" y="0" width="#{avatador.width}" height="#{avatador.height}" rx="#{avatador.rounded}" style="fill:#{avatador.background}" /><text x="50%" y="50%" dy=".1em" fill="#{avatador.color}" text-anchor="middle" dominant-baseline="middle" style="#{avatador.text_style}">#{avatador.name}</text></svg>)
  end
end
