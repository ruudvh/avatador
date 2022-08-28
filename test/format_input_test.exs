defmodule FormatInputTest do
  use ExUnit.Case

  test ":name as Integer" do
    assigns = %{
      background: "96C2ED",
      name: 10
    }

    assert Avatador.avatar(assigns) == ~s(<svg width="500.0px" height="500.0px" viewBox="0 0 500.0 500.0" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.0"><rect x="0" y="0" width="500.0" height="500.0" rx="0.0" style="fill:#96C2ED" /><text x="50%" y="50%" dy=".1em" fill="#FFFFFF" text-anchor="middle" dominant-baseline="middle" style="font-size:250.0px;line-height:1;color:#FFFFFF;font-family:Montserrat,sans-serif;">10</text></svg>)
  end

  test ":name as Float" do
    assigns = %{
      background: "96C2ED",
      name: 10.5
    }

    assert Avatador.avatar(assigns) == ~s(<svg width="500.0px" height="500.0px" viewBox="0 0 500.0 500.0" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.0"><rect x="0" y="0" width="500.0" height="500.0" rx="0.0" style="fill:#96C2ED" /><text x="50%" y="50%" dy=".1em" fill="#FFFFFF" text-anchor="middle" dominant-baseline="middle" style="font-size:250.0px;line-height:1;color:#FFFFFF;font-family:Montserrat,sans-serif;">10</text></svg>)
  end

  test ":name as Map" do
    assigns = %{
      background: "96C2ED",
      name: %{john: "cena"}
    }

    assert Avatador.avatar(assigns) == ~s(<svg width="500.0px" height="500.0px" viewBox="0 0 500.0 500.0" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.0"><rect x="0" y="0" width="500.0" height="500.0" rx="0.0" style="fill:#96C2ED" /><text x="50%" y="50%" dy=".1em" fill="#FFFFFF" text-anchor="middle" dominant-baseline="middle" style="font-size:250.0px;line-height:1;color:#FFFFFF;font-family:Montserrat,sans-serif;"></text></svg>)
  end

  test ":name as List" do
    assigns = %{
      background: "96C2ED",
      name: ["john", "cena"]
    }

    assert Avatador.avatar(assigns) == ~s(<svg width="500.0px" height="500.0px" viewBox="0 0 500.0 500.0" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.0"><rect x="0" y="0" width="500.0" height="500.0" rx="0.0" style="fill:#96C2ED" /><text x="50%" y="50%" dy=".1em" fill="#FFFFFF" text-anchor="middle" dominant-baseline="middle" style="font-size:250.0px;line-height:1;color:#FFFFFF;font-family:Montserrat,sans-serif;"></text></svg>)
  end

  test ":is_rounded as true" do
    assigns = %{
      background: "96C2ED",
      is_rounded: true,
    }

    assert Avatador.avatar(assigns) == ~s(<svg width="500.0px" height="500.0px" viewBox="0 0 500.0 500.0" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.0"><rect x="0" y="0" width="500.0" height="500.0" rx="500.0" style="fill:#96C2ED" /><text x="50%" y="50%" dy=".1em" fill="#FFFFFF" text-anchor="middle" dominant-baseline="middle" style="font-size:250.0px;line-height:1;color:#FFFFFF;font-family:Montserrat,sans-serif;"></text></svg>)
  end

  test ":is_rounded as Integer 1" do
    assigns = %{
      background: "96C2ED",
      is_rounded: 1,
    }

    assert Avatador.avatar(assigns) == ~s(<svg width="500.0px" height="500.0px" viewBox="0 0 500.0 500.0" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.0"><rect x="0" y="0" width="500.0" height="500.0" rx="500.0" style="fill:#96C2ED" /><text x="50%" y="50%" dy=".1em" fill="#FFFFFF" text-anchor="middle" dominant-baseline="middle" style="font-size:250.0px;line-height:1;color:#FFFFFF;font-family:Montserrat,sans-serif;"></text></svg>)
  end

  test ":is_rounded as Integer > 1" do
    assigns = %{
      background: "96C2ED",
      is_rounded: 15,
    }

    assert Avatador.avatar(assigns) == ~s(<svg width="500.0px" height="500.0px" viewBox="0 0 500.0 500.0" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.0"><rect x="0" y="0" width="500.0" height="500.0" rx="0.0" style="fill:#96C2ED" /><text x="50%" y="50%" dy=".1em" fill="#FFFFFF" text-anchor="middle" dominant-baseline="middle" style="font-size:250.0px;line-height:1;color:#FFFFFF;font-family:Montserrat,sans-serif;"></text></svg>)
  end

  test ":is_rounded as Float 1.0" do
    assigns = %{
      background: "96C2ED",
      is_rounded: 1.0,
    }

    assert Avatador.avatar(assigns) == ~s(<svg width="500.0px" height="500.0px" viewBox="0 0 500.0 500.0" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.0"><rect x="0" y="0" width="500.0" height="500.0" rx="0.0" style="fill:#96C2ED" /><text x="50%" y="50%" dy=".1em" fill="#FFFFFF" text-anchor="middle" dominant-baseline="middle" style="font-size:250.0px;line-height:1;color:#FFFFFF;font-family:Montserrat,sans-serif;"></text></svg>)
  end

  test ":is_rounded as Float > 1" do
    assigns = %{
      background: "96C2ED",
      is_rounded: 10.5,
    }

    assert Avatador.avatar(assigns) == ~s(<svg width="500.0px" height="500.0px" viewBox="0 0 500.0 500.0" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.0"><rect x="0" y="0" width="500.0" height="500.0" rx="0.0" style="fill:#96C2ED" /><text x="50%" y="50%" dy=".1em" fill="#FFFFFF" text-anchor="middle" dominant-baseline="middle" style="font-size:250.0px;line-height:1;color:#FFFFFF;font-family:Montserrat,sans-serif;"></text></svg>)
  end

  test ":is_rounded as String" do
    assigns = %{
      background: "96C2ED",
      is_rounded: "johncena",
    }

    assert Avatador.avatar(assigns) == ~s(<svg width="500.0px" height="500.0px" viewBox="0 0 500.0 500.0" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.0"><rect x="0" y="0" width="500.0" height="500.0" rx="0.0" style="fill:#96C2ED" /><text x="50%" y="50%" dy=".1em" fill="#FFFFFF" text-anchor="middle" dominant-baseline="middle" style="font-size:250.0px;line-height:1;color:#FFFFFF;font-family:Montserrat,sans-serif;"></text></svg>)
  end

  test ":rounded as Integer" do
    assigns = %{
      background: "96C2ED",
      rounded: 50
    }

    assert Avatador.avatar(assigns) == ~s(<svg width="500.0px" height="500.0px" viewBox="0 0 500.0 500.0" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.0"><rect x="0" y="0" width="500.0" height="500.0" rx="50.0" style="fill:#96C2ED" /><text x="50%" y="50%" dy=".1em" fill="#FFFFFF" text-anchor="middle" dominant-baseline="middle" style="font-size:250.0px;line-height:1;color:#FFFFFF;font-family:Montserrat,sans-serif;"></text></svg>)
  end

  test ":rounded as Float" do
    assigns = %{
      background: "96C2ED",
      rounded: 50.0
    }

    assert Avatador.avatar(assigns) == ~s(<svg width="500.0px" height="500.0px" viewBox="0 0 500.0 500.0" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.0"><rect x="0" y="0" width="500.0" height="500.0" rx="50.0" style="fill:#96C2ED" /><text x="50%" y="50%" dy=".1em" fill="#FFFFFF" text-anchor="middle" dominant-baseline="middle" style="font-size:250.0px;line-height:1;color:#FFFFFF;font-family:Montserrat,sans-serif;"></text></svg>)
  end

  test ":rounded as String" do
    assigns = %{
      background: "96C2ED",
      rounded: "johncena"
    }

    assert Avatador.avatar(assigns) == ~s(<svg width="500.0px" height="500.0px" viewBox="0 0 500.0 500.0" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.0"><rect x="0" y="0" width="500.0" height="500.0" rx="0.0" style="fill:#96C2ED" /><text x="50%" y="50%" dy=".1em" fill="#FFFFFF" text-anchor="middle" dominant-baseline="middle" style="font-size:250.0px;line-height:1;color:#FFFFFF;font-family:Montserrat,sans-serif;"></text></svg>)
  end

  test ":width as Integer" do
    assigns = %{
      background: "96C2ED",
      width: 20
    }

    assert Avatador.avatar(assigns) == ~s(<svg width="20.0px" height="20.0px" viewBox="0 0 20.0 20.0" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.0"><rect x="0" y="0" width="20.0" height="20.0" rx="0.0" style="fill:#96C2ED" /><text x="50%" y="50%" dy=".1em" fill="#FFFFFF" text-anchor="middle" dominant-baseline="middle" style="font-size:10.0px;line-height:1;color:#FFFFFF;font-family:Montserrat,sans-serif;"></text></svg>)
  end

  test ":width as Float" do
    assigns = %{
      background: "96C2ED",
      width: 20.0
    }

    assert Avatador.avatar(assigns) == ~s(<svg width="20.0px" height="20.0px" viewBox="0 0 20.0 20.0" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.0"><rect x="0" y="0" width="20.0" height="20.0" rx="0.0" style="fill:#96C2ED" /><text x="50%" y="50%" dy=".1em" fill="#FFFFFF" text-anchor="middle" dominant-baseline="middle" style="font-size:10.0px;line-height:1;color:#FFFFFF;font-family:Montserrat,sans-serif;"></text></svg>)
  end

  test ":width as String" do
    assigns = %{
      background: "96C2ED",
      width: "johncena"
    }

    assert Avatador.avatar(assigns) == ~s(<svg width="500.0px" height="500.0px" viewBox="0 0 500.0 500.0" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.0"><rect x="0" y="0" width="500.0" height="500.0" rx="0.0" style="fill:#96C2ED" /><text x="50%" y="50%" dy=".1em" fill="#FFFFFF" text-anchor="middle" dominant-baseline="middle" style="font-size:250.0px;line-height:1;color:#FFFFFF;font-family:Montserrat,sans-serif;"></text></svg>)
  end

  test ":width as String, but integer format" do
    assigns = %{
      background: "96C2ED",
      width: "20"
    }

    assert Avatador.avatar(assigns) == ~s(<svg width="20.0px" height="20.0px" viewBox="0 0 20.0 20.0" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.0"><rect x="0" y="0" width="20.0" height="20.0" rx="0.0" style="fill:#96C2ED" /><text x="50%" y="50%" dy=".1em" fill="#FFFFFF" text-anchor="middle" dominant-baseline="middle" style="font-size:10.0px;line-height:1;color:#FFFFFF;font-family:Montserrat,sans-serif;"></text></svg>)
  end

  test ":height as Integer" do
    assigns = %{
      background: "96C2ED",
      height: 20
    }

    assert Avatador.avatar(assigns) == ~s(<svg width="20.0px" height="20.0px" viewBox="0 0 20.0 20.0" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.0"><rect x="0" y="0" width="20.0" height="20.0" rx="0.0" style="fill:#96C2ED" /><text x="50%" y="50%" dy=".1em" fill="#FFFFFF" text-anchor="middle" dominant-baseline="middle" style="font-size:10.0px;line-height:1;color:#FFFFFF;font-family:Montserrat,sans-serif;"></text></svg>)
  end

  test ":height as Float" do
    assigns = %{
      background: "96C2ED",
      height: 20.0
    }

    assert Avatador.avatar(assigns) == ~s(<svg width="20.0px" height="20.0px" viewBox="0 0 20.0 20.0" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.0"><rect x="0" y="0" width="20.0" height="20.0" rx="0.0" style="fill:#96C2ED" /><text x="50%" y="50%" dy=".1em" fill="#FFFFFF" text-anchor="middle" dominant-baseline="middle" style="font-size:10.0px;line-height:1;color:#FFFFFF;font-family:Montserrat,sans-serif;"></text></svg>)
  end

  test ":height as String" do
    assigns = %{
      background: "96C2ED",
      height: "johncena"
    }

    assert Avatador.avatar(assigns) == ~s(<svg width="500.0px" height="500.0px" viewBox="0 0 500.0 500.0" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.0"><rect x="0" y="0" width="500.0" height="500.0" rx="0.0" style="fill:#96C2ED" /><text x="50%" y="50%" dy=".1em" fill="#FFFFFF" text-anchor="middle" dominant-baseline="middle" style="font-size:250.0px;line-height:1;color:#FFFFFF;font-family:Montserrat,sans-serif;"></text></svg>)
  end

  test ":height as String, but integer format" do
    assigns = %{
      background: "96C2ED",
      height: "20"
    }

    assert Avatador.avatar(assigns) == ~s(<svg width="20.0px" height="20.0px" viewBox="0 0 20.0 20.0" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.0"><rect x="0" y="0" width="20.0" height="20.0" rx="0.0" style="fill:#96C2ED" /><text x="50%" y="50%" dy=".1em" fill="#FFFFFF" text-anchor="middle" dominant-baseline="middle" style="font-size:10.0px;line-height:1;color:#FFFFFF;font-family:Montserrat,sans-serif;"></text></svg>)
  end

  test ":font_size as Integer" do
    assigns = %{
      background: "96C2ED",
      font_size: 10
    }

    assert Avatador.avatar(assigns) == ~s(<svg width="500.0px" height="500.0px" viewBox="0 0 500.0 500.0" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.0"><rect x="0" y="0" width="500.0" height="500.0" rx="0.0" style="fill:#96C2ED" /><text x="50%" y="50%" dy=".1em" fill="#FFFFFF" text-anchor="middle" dominant-baseline="middle" style="font-size:10.0px;line-height:1;color:#FFFFFF;font-family:Montserrat,sans-serif;"></text></svg>)
  end

  test ":font_size as Float" do
    assigns = %{
      background: "96C2ED",
      font_size: 10.0
    }

    assert Avatador.avatar(assigns) == ~s(<svg width="500.0px" height="500.0px" viewBox="0 0 500.0 500.0" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.0"><rect x="0" y="0" width="500.0" height="500.0" rx="0.0" style="fill:#96C2ED" /><text x="50%" y="50%" dy=".1em" fill="#FFFFFF" text-anchor="middle" dominant-baseline="middle" style="font-size:10.0px;line-height:1;color:#FFFFFF;font-family:Montserrat,sans-serif;"></text></svg>)
  end

  test ":font_size as String" do
    assigns = %{
      background: "96C2ED",
      font_size: "johncena"
    }

    assert Avatador.avatar(assigns) == ~s(<svg width="500.0px" height="500.0px" viewBox="0 0 500.0 500.0" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.0"><rect x="0" y="0" width="500.0" height="500.0" rx="0.0" style="fill:#96C2ED" /><text x="50%" y="50%" dy=".1em" fill="#FFFFFF" text-anchor="middle" dominant-baseline="middle" style="font-size:250.0px;line-height:1;color:#FFFFFF;font-family:Montserrat,sans-serif;"></text></svg>)
  end

  test ":caps value as Integer" do
    assigns = %{
      background: "96C2ED",
      name: "john cena",
      caps: 1
    }

    assert Avatador.avatar(assigns) == ~s(<svg width="500.0px" height="500.0px" viewBox="0 0 500.0 500.0" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.0"><rect x="0" y="0" width="500.0" height="500.0" rx="0.0" style="fill:#96C2ED" /><text x="50%" y="50%" dy=".1em" fill="#FFFFFF" text-anchor="middle" dominant-baseline="middle" style="font-size:250.0px;line-height:1;color:#FFFFFF;font-family:Montserrat,sans-serif;">JC</text></svg>)
  end

  test ":caps value as Integer > 3" do
    assigns = %{
      background: "96C2ED",
      name: "john cena",
      caps: 4
    }

    assert Avatador.avatar(assigns) == ~s(<svg width="500.0px" height="500.0px" viewBox="0 0 500.0 500.0" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.0"><rect x="0" y="0" width="500.0" height="500.0" rx="0.0" style="fill:#96C2ED" /><text x="50%" y="50%" dy=".1em" fill="#FFFFFF" text-anchor="middle" dominant-baseline="middle" style="font-size:250.0px;line-height:1;color:#FFFFFF;font-family:Montserrat,sans-serif;">JC</text></svg>)
  end

  test ":caps value as Float" do
    assigns = %{
      background: "96C2ED",
      name: "john cena",
      caps: 1.0
    }

    assert Avatador.avatar(assigns) == ~s(<svg width="500.0px" height="500.0px" viewBox="0 0 500.0 500.0" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.0"><rect x="0" y="0" width="500.0" height="500.0" rx="0.0" style="fill:#96C2ED" /><text x="50%" y="50%" dy=".1em" fill="#FFFFFF" text-anchor="middle" dominant-baseline="middle" style="font-size:250.0px;line-height:1;color:#FFFFFF;font-family:Montserrat,sans-serif;">JC</text></svg>)
  end

  test ":caps value as Integer < 0" do
    assigns = %{
      background: "96C2ED",
      name: "john cena",
      caps: -5
    }

    assert Avatador.avatar(assigns) == ~s(<svg width="500.0px" height="500.0px" viewBox="0 0 500.0 500.0" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.0"><rect x="0" y="0" width="500.0" height="500.0" rx="0.0" style="fill:#96C2ED" /><text x="50%" y="50%" dy=".1em" fill="#FFFFFF" text-anchor="middle" dominant-baseline="middle" style="font-size:250.0px;line-height:1;color:#FFFFFF;font-family:Montserrat,sans-serif;">JC</text></svg>)
  end

  test ":caps value as String" do
    assigns = %{
      background: "96C2ED",
      name: "john cena",
      caps: "johncena"
    }

    assert Avatador.avatar(assigns) == ~s(<svg width="500.0px" height="500.0px" viewBox="0 0 500.0 500.0" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.0"><rect x="0" y="0" width="500.0" height="500.0" rx="0.0" style="fill:#96C2ED" /><text x="50%" y="50%" dy=".1em" fill="#FFFFFF" text-anchor="middle" dominant-baseline="middle" style="font-size:250.0px;line-height:1;color:#FFFFFF;font-family:Montserrat,sans-serif;">JC</text></svg>)
  end

  test ":bold as Integer" do
    assigns = %{
      background: "96C2ED",
      name: "John cena",
      bold: 1
    }

    assert Avatador.avatar(assigns) == ~s(<svg width="500.0px" height="500.0px" viewBox="0 0 500.0 500.0" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.0"><rect x="0" y="0" width="500.0" height="500.0" rx="0.0" style="fill:#96C2ED" /><text x="50%" y="50%" dy=".1em" fill="#FFFFFF" text-anchor="middle" dominant-baseline="middle" style="font-size:250.0px;line-height:1;color:#FFFFFF;font-weight:700;font-family:Montserrat,sans-serif;">JC</text></svg>)
  end

  test ":bold as Integer > 1" do
    assigns = %{
      background: "96C2ED",
      name: "John cena",
      bold: 15
    }

    assert Avatador.avatar(assigns) == ~s(<svg width="500.0px" height="500.0px" viewBox="0 0 500.0 500.0" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.0"><rect x="0" y="0" width="500.0" height="500.0" rx="0.0" style="fill:#96C2ED" /><text x="50%" y="50%" dy=".1em" fill="#FFFFFF" text-anchor="middle" dominant-baseline="middle" style="font-size:250.0px;line-height:1;color:#FFFFFF;font-family:Montserrat,sans-serif;">JC</text></svg>)
  end

  test ":bold as Integer < 1.0" do
    assigns = %{
      background: "96C2ED",
      name: "John cena",
      bold: -15
    }

    assert Avatador.avatar(assigns) == ~s(<svg width="500.0px" height="500.0px" viewBox="0 0 500.0 500.0" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.0"><rect x="0" y="0" width="500.0" height="500.0" rx="0.0" style="fill:#96C2ED" /><text x="50%" y="50%" dy=".1em" fill="#FFFFFF" text-anchor="middle" dominant-baseline="middle" style="font-size:250.0px;line-height:1;color:#FFFFFF;font-family:Montserrat,sans-serif;">JC</text></svg>)
  end

  test ":bold as Float" do
    assigns = %{
      background: "96C2ED",
      name: "John cena",
      bold: 1.0
    }

    assert Avatador.avatar(assigns) == ~s(<svg width="500.0px" height="500.0px" viewBox="0 0 500.0 500.0" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.0"><rect x="0" y="0" width="500.0" height="500.0" rx="0.0" style="fill:#96C2ED" /><text x="50%" y="50%" dy=".1em" fill="#FFFFFF" text-anchor="middle" dominant-baseline="middle" style="font-size:250.0px;line-height:1;color:#FFFFFF;font-family:Montserrat,sans-serif;">JC</text></svg>)
  end

  test ":bold as Float > 1.0" do
    assigns = %{
      background: "96C2ED",
      name: "John cena",
      bold: 15.0
    }

    assert Avatador.avatar(assigns) == ~s(<svg width="500.0px" height="500.0px" viewBox="0 0 500.0 500.0" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.0"><rect x="0" y="0" width="500.0" height="500.0" rx="0.0" style="fill:#96C2ED" /><text x="50%" y="50%" dy=".1em" fill="#FFFFFF" text-anchor="middle" dominant-baseline="middle" style="font-size:250.0px;line-height:1;color:#FFFFFF;font-family:Montserrat,sans-serif;">JC</text></svg>)
  end

  test ":bold as Float < 1.0" do
    assigns = %{
      background: "96C2ED",
      name: "John cena",
      bold: -15.0
    }

    assert Avatador.avatar(assigns) == ~s(<svg width="500.0px" height="500.0px" viewBox="0 0 500.0 500.0" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.0"><rect x="0" y="0" width="500.0" height="500.0" rx="0.0" style="fill:#96C2ED" /><text x="50%" y="50%" dy=".1em" fill="#FFFFFF" text-anchor="middle" dominant-baseline="middle" style="font-size:250.0px;line-height:1;color:#FFFFFF;font-family:Montserrat,sans-serif;">JC</text></svg>)
  end

  test ":bold as String" do
    assigns = %{
      background: "96C2ED",
      name: "John cena",
      bold: "johncena"
    }

    assert Avatador.avatar(assigns) == ~s(<svg width="500.0px" height="500.0px" viewBox="0 0 500.0 500.0" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.0"><rect x="0" y="0" width="500.0" height="500.0" rx="0.0" style="fill:#96C2ED" /><text x="50%" y="50%" dy=".1em" fill="#FFFFFF" text-anchor="middle" dominant-baseline="middle" style="font-size:250.0px;line-height:1;color:#FFFFFF;font-family:Montserrat,sans-serif;">JC</text></svg>)
  end
end
