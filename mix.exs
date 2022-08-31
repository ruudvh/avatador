defmodule Avatador.MixProject do
  use Mix.Project

  @github_url "https://github.com/ruudvh/avatador"
  @homepage_url "https://www.avatador.io"
  @docs_url "https://hexdocs.pm/avatador"

  @name "Avatador"
  @version "0.1.0"

  def project do
    [
      app: :avatador,
      version: "0.1.0",
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      description: description(),
      package: package(),
      deps: deps(),
      docs: docs(),
      source_url: @github_url,
      homepage_url: @homepage_url,
    ]
  end

  defp description do
    """
    Super simple avatar and (Github-like) identicon generator in Elixir.
    """
  end

  defp package do
    [
      name: @name,
      maintainers: ["Ruud"],
      contributors: ["Ruud"],
      licenses: ["MIT"],
      links: %{
          "Home" => @homepage_url,
          "GitHub" => @github_url,
          "Docs" => @docs_url}
    ]
  end

  defp docs() do
    [
      main: "readme",
      logo: "logo.png",
      name: @name,
      source_ref: "v#{@version}",
      canonical: @homepage_url,
      source_url: @github_url,
      homepage_url: @homepage_url,
      extras: ["README.md"]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :crypto]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_doc, "~> 0.24", only: :dev, runtime: false},
      {:egd, github: "erlang/egd", optional: true}, # Erlang Graphic Drawer, for PNG export of identicons
    ]
  end
end
