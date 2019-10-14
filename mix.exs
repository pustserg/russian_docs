defmodule RussianDocs.MixProject do
  use Mix.Project

  def project do
    [
      app: :russian_docs,
      version: "0.1.0",
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      description: description(),
      package: package(),
      source_url: "https://github.com/pustserg/russian_docs"
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end

  defp description do
    "Validates and format number of some russian docs"
  end

  defp package do
    [
      name: "russian docs",
      files: ~w(lib test LICENSE mix.exs README.md),
      licenses: ~w(MIT),
      links: %{"Github" => "https://github.com/pustserg/russian_docs"}
    ]
  end
end
