defmodule IdenticonTest do
  use ExUnit.Case

   test "render PNG, rendering is deterministic" do
     {:ok, image} = File.read("test/fixtures/elixir.png")
     image_base64 = Base.encode64(image)

    Enum.each 1..2, fn(_) ->
       generated_base64 = Avatador.identicon(%{format: "png", name: "Elixir", width: "250"})
       assert generated_base64 == image_base64
     end
   end

  test "render SVG, rendering is deterministic" do
    svg = ~s(<svg style="border-radius:0.0px;" width="500.0px" height="500.0px" viewBox="0 0 500.0 500.0" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.0"><rect fill="rgba\(161,46,176,1\)" x="0" y="0" width="100" height="100"/><rect fill="rgba\(161,46,176,1\)" x="100" y="0" width="100" height="100"/><rect fill="rgba\(161,46,176,1\)" x="200" y="0" width="100" height="100"/><rect fill="rgba\(161,46,176,1\)" x="300" y="0" width="100" height="100"/><rect fill="rgba\(161,46,176,1\)" x="400" y="0" width="100" height="100"/><rect fill="rgba\(161,46,176,1\)" x="0" y="100" width="100" height="100"/><rect fill="rgba\(161,46,176,1\)" x="400" y="100" width="100" height="100"/><rect fill="rgba\(161,46,176,1\)" x="0" y="200" width="100" height="100"/><rect fill="rgba\(161,46,176,1\)" x="100" y="200" width="100" height="100"/><rect fill="rgba\(161,46,176,1\)" x="300" y="200" width="100" height="100"/><rect fill="rgba\(161,46,176,1\)" x="400" y="200" width="100" height="100"/><rect fill="rgba\(161,46,176,1\)" x="200" y="300" width="100" height="100"/></svg>)

    Enum.each 1..2, fn(_) ->
      generated_svg = Avatador.identicon(%{format: "svg", name: "Elixir"})
      assert generated_svg == svg
    end
  end
end
