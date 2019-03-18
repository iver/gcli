defmodule Gcli.MixProject do
  use Mix.Project

  def project do
    [
      app: :gcli,
      version: version(),
      hash: hash(),
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      escript: escript()
    ]
  end

  defp escript do
    [main_module: Gcli]
  end

  defp version() do
    # Enum.join([tags(), hash()], " ")
    tags()
  end

  defp hash() do
    {git_sha, _exit_code} = System.cmd("git", ["rev-parse", "HEAD"])
    if String.length(git_sha) >= 40, do: String.slice(git_sha, 0..39), else: "c0d3n1l"
  end

  defp tags() do
    {git_sha, _exit_code} = System.cmd("git", ["rev-list", "--tags", "--max-count=1"])
    sha_tag = if String.length(git_sha) >= 40, do: String.slice(git_sha, 0..7), else: "c0d3n1l"
    {ver, exit_code} = System.cmd("git", ["describe","--tags", sha_tag], stderr_to_stdout: true)
    if String.length(ver) >= 8 && exit_code == 0, do: String.slice(ver, 0..7), else: "0.0.1"
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
      {:googlon, git: "git@github.com:iver/googlon.git", tag: "v0.1.0", app: false}
    ]
  end
end
