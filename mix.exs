defmodule Glitchylicious.Mixfile do
  use Mix.Project

  def project do
    [app: :glitchylicious,
     version: "0.0.2",
     elixir: "~> 1.0",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps,
     package: package]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [applications: [:logger]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type `mix help deps` for more examples and options
  defp deps do
    []
  end

  defp package do
    [
      description: "Glitching and image corruption library.",
      files: ["lib/glitchylicious.ex", "mix.exs", "README.md", "LICENSE*"],
      maintainers: ["0010"],
      licenses: ["MIT License"],
      links: %{"Port of glitch-canvas" => "https://github.com/snorpey/glitch-canvas",
               "GitHub" => "https://github.com/0010-IO/glitchylicious",
               "0010" => "http://0010.io"}
    ]
  end
end
