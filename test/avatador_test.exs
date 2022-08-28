defmodule AvatadorTest do
  use ExUnit.Case
  doctest Avatador

  # can't add one with zero options due to random color
  # test "create a svg with no options provided" do

  test "create a svg with only background (RRGGBB) provided" do
    assigns = %{
      background: "96C2ED"
    }

    assert Avatador.avatar(assigns) == ~s(<svg width="500.0px" height="500.0px" viewBox="0 0 500.0 500.0" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.0"><rect x="0" y="0" width="500.0" height="500.0" rx="0.0" style="fill:#96C2ED" /><text x="50%" y="50%" dy=".1em" fill="#FFFFFF" text-anchor="middle" dominant-baseline="middle" style="font-size:250.0px;line-height:1;color:#FFFFFF;font-family:Montserrat,sans-serif;"></text></svg>)
  end

  test "create a svg with only background (RRGGBBAA) provided" do
    assigns = %{
      background: "96C2EDCC"
    }

    assert Avatador.avatar(assigns) == ~s(<svg width="500.0px" height="500.0px" viewBox="0 0 500.0 500.0" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.0"><rect x="0" y="0" width="500.0" height="500.0" rx="0.0" style="fill:#96C2EDCC" /><text x="50%" y="50%" dy=".1em" fill="#FFFFFF" text-anchor="middle" dominant-baseline="middle" style="font-size:250.0px;line-height:1;color:#FFFFFF;font-family:Montserrat,sans-serif;"></text></svg>)
  end

  test "create a svg with only background (RGB) provided" do
    assigns = %{
      background: "96C"
    }

    assert Avatador.avatar(assigns) == ~s(<svg width="500.0px" height="500.0px" viewBox="0 0 500.0 500.0" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.0"><rect x="0" y="0" width="500.0" height="500.0" rx="0.0" style="fill:#96C" /><text x="50%" y="50%" dy=".1em" fill="#FFFFFF" text-anchor="middle" dominant-baseline="middle" style="font-size:250.0px;line-height:1;color:#FFFFFF;font-family:Montserrat,sans-serif;"></text></svg>)
  end

  test "create a svg with only background (RGBA) provided" do
    assigns = %{
      background: "96C2"
    }

    assert Avatador.avatar(assigns) == ~s(<svg width="500.0px" height="500.0px" viewBox="0 0 500.0 500.0" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.0"><rect x="0" y="0" width="500.0" height="500.0" rx="0.0" style="fill:#96C2" /><text x="50%" y="50%" dy=".1em" fill="#FFFFFF" text-anchor="middle" dominant-baseline="middle" style="font-size:250.0px;line-height:1;color:#FFFFFF;font-family:Montserrat,sans-serif;"></text></svg>)
  end

  test "create a svg with background and color provided" do
    assigns = %{
      background: "96C2ED",
      color: "000000"
    }

    assert Avatador.avatar(assigns) == ~s(<svg width="500.0px" height="500.0px" viewBox="0 0 500.0 500.0" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.0"><rect x="0" y="0" width="500.0" height="500.0" rx="0.0" style="fill:#96C2ED" /><text x="50%" y="50%" dy=".1em" fill="#000000" text-anchor="middle" dominant-baseline="middle" style="font-size:250.0px;line-height:1;color:#000000;font-family:Montserrat,sans-serif;"></text></svg>)
  end

  test "create a svg with background and name, one word, provided" do
    assigns = %{
      background: "96C2ED",
      name: "John"
    }

    assert Avatador.avatar(assigns) == ~s(<svg width="500.0px" height="500.0px" viewBox="0 0 500.0 500.0" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.0"><rect x="0" y="0" width="500.0" height="500.0" rx="0.0" style="fill:#96C2ED" /><text x="50%" y="50%" dy=".1em" fill="#FFFFFF" text-anchor="middle" dominant-baseline="middle" style="font-size:250.0px;line-height:1;color:#FFFFFF;font-family:Montserrat,sans-serif;">JO</text></svg>)
  end

  test "create a svg with background and name, two words, provided" do
    assigns = %{
      background: "96C2ED",
      name: "John Cena"
    }

    assert Avatador.avatar(assigns) == ~s(<svg width="500.0px" height="500.0px" viewBox="0 0 500.0 500.0" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.0"><rect x="0" y="0" width="500.0" height="500.0" rx="0.0" style="fill:#96C2ED" /><text x="50%" y="50%" dy=".1em" fill="#FFFFFF" text-anchor="middle" dominant-baseline="middle" style="font-size:250.0px;line-height:1;color:#FFFFFF;font-family:Montserrat,sans-serif;">JC</text></svg>)
  end

  test "create a svg with background and name, three words, provided" do
    assigns = %{
      background: "96C2ED",
      name: "John Cena can"
    }

    assert Avatador.avatar(assigns) == ~s(<svg width="500.0px" height="500.0px" viewBox="0 0 500.0 500.0" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.0"><rect x="0" y="0" width="500.0" height="500.0" rx="0.0" style="fill:#96C2ED" /><text x="50%" y="50%" dy=".1em" fill="#FFFFFF" text-anchor="middle" dominant-baseline="middle" style="font-size:250.0px;line-height:1;color:#FFFFFF;font-family:Montserrat,sans-serif;">JC</text></svg>)
  end

  test "create a svg with background and name, four words, provided" do
    assigns = %{
      background: "96C2ED",
      name: "John Cena can see"
    }

    assert Avatador.avatar(assigns) == ~s(<svg width="500.0px" height="500.0px" viewBox="0 0 500.0 500.0" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.0"><rect x="0" y="0" width="500.0" height="500.0" rx="0.0" style="fill:#96C2ED" /><text x="50%" y="50%" dy=".1em" fill="#FFFFFF" text-anchor="middle" dominant-baseline="middle" style="font-size:250.0px;line-height:1;color:#FFFFFF;font-family:Montserrat,sans-serif;">JS</text></svg>)
  end

  test "create a svg with background and name, five words, provided" do
    assigns = %{
      background: "96C2ED",
      name: "John Cena can see you"
    }

    assert Avatador.avatar(assigns) == ~s(<svg width="500.0px" height="500.0px" viewBox="0 0 500.0 500.0" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.0"><rect x="0" y="0" width="500.0" height="500.0" rx="0.0" style="fill:#96C2ED" /><text x="50%" y="50%" dy=".1em" fill="#FFFFFF" text-anchor="middle" dominant-baseline="middle" style="font-size:250.0px;line-height:1;color:#FFFFFF;font-family:Montserrat,sans-serif;">JY</text></svg>)
  end

  test "create a svg with background and name, zero words, provided" do
    assigns = %{
      background: "96C2ED",
      name: ""
    }

    assert Avatador.avatar(assigns) == ~s(<svg width="500.0px" height="500.0px" viewBox="0 0 500.0 500.0" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.0"><rect x="0" y="0" width="500.0" height="500.0" rx="0.0" style="fill:#96C2ED" /><text x="50%" y="50%" dy=".1em" fill="#FFFFFF" text-anchor="middle" dominant-baseline="middle" style="font-size:250.0px;line-height:1;color:#FFFFFF;font-family:Montserrat,sans-serif;"></text></svg>)
  end

  test "create a svg with background and is_rounded=true provided" do
    assigns = %{
      background: "96C2ED",
      is_rounded: "true",
    }

    assert Avatador.avatar(assigns) == ~s(<svg width="500.0px" height="500.0px" viewBox="0 0 500.0 500.0" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.0"><rect x="0" y="0" width="500.0" height="500.0" rx="500.0" style="fill:#96C2ED" /><text x="50%" y="50%" dy=".1em" fill="#FFFFFF" text-anchor="middle" dominant-baseline="middle" style="font-size:250.0px;line-height:1;color:#FFFFFF;font-family:Montserrat,sans-serif;"></text></svg>)
  end

  test "create a svg with background and is_rounded=false provided" do
    assigns = %{
      background: "96C2ED",
      is_rounded: "false",
    }

    assert Avatador.avatar(assigns) == ~s(<svg width="500.0px" height="500.0px" viewBox="0 0 500.0 500.0" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.0"><rect x="0" y="0" width="500.0" height="500.0" rx="0.0" style="fill:#96C2ED" /><text x="50%" y="50%" dy=".1em" fill="#FFFFFF" text-anchor="middle" dominant-baseline="middle" style="font-size:250.0px;line-height:1;color:#FFFFFF;font-family:Montserrat,sans-serif;"></text></svg>)
  end

  test "create a svg with background and is_rounded=false, but a rounded value provided" do
    assigns = %{
      background: "96C2ED",
      is_rounded: "false",
      rounded: "50.0"
    }

    assert Avatador.avatar(assigns) == ~s(<svg width="500.0px" height="500.0px" viewBox="0 0 500.0 500.0" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.0"><rect x="0" y="0" width="500.0" height="500.0" rx="50.0" style="fill:#96C2ED" /><text x="50%" y="50%" dy=".1em" fill="#FFFFFF" text-anchor="middle" dominant-baseline="middle" style="font-size:250.0px;line-height:1;color:#FFFFFF;font-family:Montserrat,sans-serif;"></text></svg>)
  end

  test "create a svg with background and is_rounded=true, and a rounded value provided" do
    assigns = %{
      background: "96C2ED",
      is_rounded: "true",
      rounded: "50.0"
    }

    assert Avatador.avatar(assigns) == ~s(<svg width="500.0px" height="500.0px" viewBox="0 0 500.0 500.0" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.0"><rect x="0" y="0" width="500.0" height="500.0" rx="50.0" style="fill:#96C2ED" /><text x="50%" y="50%" dy=".1em" fill="#FFFFFF" text-anchor="middle" dominant-baseline="middle" style="font-size:250.0px;line-height:1;color:#FFFFFF;font-family:Montserrat,sans-serif;"></text></svg>)
  end

  test "create a svg with background and a rounded value, but no is_rounded provided" do
    assigns = %{
      background: "96C2ED",
      rounded: "50.0"
    }

    assert Avatador.avatar(assigns) == ~s(<svg width="500.0px" height="500.0px" viewBox="0 0 500.0 500.0" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.0"><rect x="0" y="0" width="500.0" height="500.0" rx="50.0" style="fill:#96C2ED" /><text x="50%" y="50%" dy=".1em" fill="#FFFFFF" text-anchor="middle" dominant-baseline="middle" style="font-size:250.0px;line-height:1;color:#FFFFFF;font-family:Montserrat,sans-serif;"></text></svg>)
  end

  test "create a svg with background and width provided" do
    assigns = %{
      background: "96C2ED",
      width: "20.0"
    }

    assert Avatador.avatar(assigns) == ~s(<svg width="20.0px" height="20.0px" viewBox="0 0 20.0 20.0" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.0"><rect x="0" y="0" width="20.0" height="20.0" rx="0.0" style="fill:#96C2ED" /><text x="50%" y="50%" dy=".1em" fill="#FFFFFF" text-anchor="middle" dominant-baseline="middle" style="font-size:10.0px;line-height:1;color:#FFFFFF;font-family:Montserrat,sans-serif;"></text></svg>)
  end

  test "create a svg with background and height provided" do
    assigns = %{
      background: "96C2ED",
      height: "20.0"
    }

    assert Avatador.avatar(assigns) == ~s(<svg width="20.0px" height="20.0px" viewBox="0 0 20.0 20.0" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.0"><rect x="0" y="0" width="20.0" height="20.0" rx="0.0" style="fill:#96C2ED" /><text x="50%" y="50%" dy=".1em" fill="#FFFFFF" text-anchor="middle" dominant-baseline="middle" style="font-size:10.0px;line-height:1;color:#FFFFFF;font-family:Montserrat,sans-serif;"></text></svg>)
  end

  test "create a svg with background and same width and height provided" do
    assigns = %{
      background: "96C2ED",
      width: "20.0",
      height: "20.0"
    }

    assert Avatador.avatar(assigns) == ~s(<svg width="20.0px" height="20.0px" viewBox="0 0 20.0 20.0" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.0"><rect x="0" y="0" width="20.0" height="20.0" rx="0.0" style="fill:#96C2ED" /><text x="50%" y="50%" dy=".1em" fill="#FFFFFF" text-anchor="middle" dominant-baseline="middle" style="font-size:10.0px;line-height:1;color:#FFFFFF;font-family:Montserrat,sans-serif;"></text></svg>)
  end

  test "create a svg with background and different width and height provided" do
    assigns = %{
      background: "96C2ED",
      width: "40.0",
      height: "20.0"
    }

    assert Avatador.avatar(assigns) == ~s(<svg width="40.0px" height="20.0px" viewBox="0 0 40.0 20.0" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.0"><rect x="0" y="0" width="40.0" height="20.0" rx="0.0" style="fill:#96C2ED" /><text x="50%" y="50%" dy=".1em" fill="#FFFFFF" text-anchor="middle" dominant-baseline="middle" style="font-size:10.0px;line-height:1;color:#FFFFFF;font-family:Montserrat,sans-serif;"></text></svg>)
  end

  test "create a svg with background and font_size provided" do
    assigns = %{
      background: "96C2ED",
      font_size: "10.0"
    }

    assert Avatador.avatar(assigns) == ~s(<svg width="500.0px" height="500.0px" viewBox="0 0 500.0 500.0" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.0"><rect x="0" y="0" width="500.0" height="500.0" rx="0.0" style="fill:#96C2ED" /><text x="50%" y="50%" dy=".1em" fill="#FFFFFF" text-anchor="middle" dominant-baseline="middle" style="font-size:10.0px;line-height:1;color:#FFFFFF;font-family:Montserrat,sans-serif;"></text></svg>)
  end

  test "create a svg with background, name, and caps (1 = upper) provided" do
    assigns = %{
      background: "96C2ED",
      name: "john cena",
      caps: "1"
    }

    assert Avatador.avatar(assigns) == ~s(<svg width="500.0px" height="500.0px" viewBox="0 0 500.0 500.0" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.0"><rect x="0" y="0" width="500.0" height="500.0" rx="0.0" style="fill:#96C2ED" /><text x="50%" y="50%" dy=".1em" fill="#FFFFFF" text-anchor="middle" dominant-baseline="middle" style="font-size:250.0px;line-height:1;color:#FFFFFF;font-family:Montserrat,sans-serif;">JC</text></svg>)
  end

  test "create a svg with background, name, and caps (2 = lower) provided" do
    assigns = %{
      background: "96C2ED",
      name: "John Cena",
      caps: "2"
    }

    assert Avatador.avatar(assigns) == ~s(<svg width="500.0px" height="500.0px" viewBox="0 0 500.0 500.0" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.0"><rect x="0" y="0" width="500.0" height="500.0" rx="0.0" style="fill:#96C2ED" /><text x="50%" y="50%" dy=".1em" fill="#FFFFFF" text-anchor="middle" dominant-baseline="middle" style="font-size:250.0px;line-height:1;color:#FFFFFF;font-family:Montserrat,sans-serif;">jc</text></svg>)
  end

  test "create a svg with background, name, and caps (3 = leave) provided" do
    assigns = %{
      background: "96C2ED",
      name: "John cena",
      caps: "3"
    }

    assert Avatador.avatar(assigns) == ~s(<svg width="500.0px" height="500.0px" viewBox="0 0 500.0 500.0" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.0"><rect x="0" y="0" width="500.0" height="500.0" rx="0.0" style="fill:#96C2ED" /><text x="50%" y="50%" dy=".1em" fill="#FFFFFF" text-anchor="middle" dominant-baseline="middle" style="font-size:250.0px;line-height:1;color:#FFFFFF;font-family:Montserrat,sans-serif;">Jc</text></svg>)
  end

  test "create a svg with background, name, and bold provided" do
    assigns = %{
      background: "96C2ED",
      name: "John cena",
      bold: "true"
    }

    assert Avatador.avatar(assigns) == ~s(<svg width="500.0px" height="500.0px" viewBox="0 0 500.0 500.0" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.0"><rect x="0" y="0" width="500.0" height="500.0" rx="0.0" style="fill:#96C2ED" /><text x="50%" y="50%" dy=".1em" fill="#FFFFFF" text-anchor="middle" dominant-baseline="middle" style="font-size:250.0px;line-height:1;color:#FFFFFF;font-weight:700;font-family:Montserrat,sans-serif;">JC</text></svg>)
  end
end
