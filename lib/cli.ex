defmodule Cli do
  @moduledoc """
  Documentation for Cli.
  """

  def main(args \\[]) do
    args
    |> parse_args
    |> response
    |> IO.puts()
  end

  defp parse_args(args) do
    switches = [parse: :string, count: :string, sort: :string]
    aliases = [p: :parse, c: :count, s: :sort]
    {opts, word, _} =
      args
      |> OptionParser.parse(switches: switches, aliases: aliases)

    {opts, List.to_string(word)}
  end

  defp response({opts, word}) do
    if opts[:parse], do: String.upcase(word), else: word
  end

end
