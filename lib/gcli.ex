defmodule Gcli do
  @moduledoc """
  Documentation for Gcli.
  """
  require Logger

  def main(args \\ []) do
    args
    |> parse_args
    |> response
    |> IO.puts()
  end

  defp parse_args(args) do
    switches = [sort: :string, count: :string, parse: :string, help: :boolean, version: :boolean]
    aliases = [s: :sort, c: :count, p: :parse, h: :help, v: :version]

    OptionParser.parse(args, switches: switches, aliases: aliases)
  end

  defp response({switches, args, invalid}) do
    if is_nil(invalid) == false && length(invalid) > 0 do
      # TODO: Use args and invalid data if required
      Logger.info("Ivalid args: #{inspect(invalid)} -> args: #{inspect(args)}")
    end

    Enum.each(switches, fn switch -> run(switch) end)

    if length(switches) == 0 do
      IO.puts("gcli: Ilegal option.\n")
      Gcli.Help.use()
    end
  end

  @doc """
  Returns parsed text with counts prespositions, verbs, subjunctive verbs and sort each word according to googlon alphabet (sxocqnmwpfyheljrdgui).

  ## Examples

      iex> import ExUnit.CaptureIO
      iex> capture_io(fn -> Gcli.run({:parse, "sfoqmd rsogxd iygsex qinhmjul qdrulxogji qhmoixw xclpedqmi dgsloqe"}) end)
      "There are 3 preposition in the text\\nThere are 5 verbs in the text\\nThere are 3 subjunctive verbs in the text\\nVocabulary list: sfoqmd xclpedqmi qhmoixw qdrulxogji qinhmjul rsogxd dgsloqe iygsex\\nThere are 3 distinct pretty numbers in the text\\n"

      iex> import ExUnit.CaptureIO
      iex> capture_io(fn -> Gcli.run {:count, "sfoqmd rsogxd iygsex qinhmjul qdrulxogji qhmoixw xclpedqmi dgsloqe"} end)
      "There are 3 preposition in the text\\nThere are 5 verbs in the text\\nThere are 3 subjunctive verbs in the text\\n"

      iex> import ExUnit.CaptureIO
      iex> capture_io(fn -> Gcli.run {:sort, "sfoqmd rsogxd iygsex qinhmjul qdrulxogji qhmoixw xclpedqmi dgsloqe"} end)
      "Vocabulary list: sfoqmd xclpedqmi qhmoixw qdrulxogji qinhmjul rsogxd dgsloqe iygsex\\n"

      iex> import ExUnit.CaptureIO
      iex> capture_io(fn -> Gcli.run {:version, true} end)
      "Googlon version: 0.1.0\\n"

      iex> import ExUnit.CaptureIO
      iex> capture_io(fn -> Gcli.run {:help, true} end)
      "NAME\\n\\t Gcli -- Googlon command line interface\\n\\nSYNOPSIS\\n\\t gcli [--parse(default)] <text to parse>\\n\\nAUTHOR\\n\\t Iván Jaimes\\n\\t ivan@iver.mx\\n\\nDESCRIPTION\\n\\t For prepositions, verbs, subjunctive verbs, lexicographical order and number representation in Googlon language Gcli\\n       parse, count, order and show words. Whether you need convert from googlon number to decimal number, gcli allows you to\\n       knows the pretty googlon numbers too.\\n\\n    \\nOPTIONS\\n\\t -s | --sort \\t\\tSorts the words of the text added according to the alphabet.\\n\\t -c | --count \\t\\tCounts the googlon counts prepositions, verbs, subjunctive verbs and pretty numbers.\\n\\t -p | --parse \\t\\tParse the googlon text given and extract words, counts prepositions, verbs, subjunctive verbs\\n                             \\tand sort each word according to googlon alphabet (sxocqnmwpfyheljrdgui).\\n\\t -h | --help \\t\\tShows the help.\\n\\t -v | --version \tShows the gcli version.\\n"

  """
  def run({:parse, data}) do
    Googlon.parse(data)
  end

  def run({:count, data}) do
    words = String.split(data, " ")
    Gcli.Screen.print(words)
  end

  def run({:sort, data}) do
    words = String.split(data, " ")
    Gcli.Screen.print({:sort, words})
  end

  def run({:help, true}) do
    Gcli.Help.use()
  end

  def run({:version, true}) do
    v =
      case File.read("assets/version") do
        {:ok, content} ->
          list = String.split(content, "\n")
          hd(list)

        {:error, _reason} ->
          "0.0.1"
      end

    IO.puts("Googlon version: #{v}")
  end
end
