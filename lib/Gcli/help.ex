defmodule Gcli.Help do
  @moduledoc """
  Expose information to the user.
  Print on the screen how can we use the cli.
  """

  def use() do
    IO.puts "NAME"
    IO.puts "\t Gcli -- Googlon command line interface\n"
    IO.puts "SYNOPSIS"
    IO.puts "\t gcli [--parse(default)] <text to parse>\n"
    author()
    description()
    sort()
    count()
    parse()
    help()
    version()
  end

  defp description() do
    IO.puts "DESCRIPTION"
    IO.puts "\t For prepositions, verbs, subjunctive verbs, lexicographical order and number representation in Googlon language Gcli
       parse, count, order and show words. Whether you need convert from googlon number to decimal number, gcli allows you to
       knows the pretty googlon numbers too.\n
    "
    IO.puts "OPTIONS"
  end

  defp parse() do
    IO.puts "\t -p | --parse \t\tParse the googlon text given and extract words, counts prepositions, verbs subjunctive verbs
                             \tand sort each word according to googlon alphabet (sxocqnmwpfyheljrdgui)."
  end

  defp count() do
    IO.puts "\t -c | --count \t\tCounts the googlon counts prepositions, verbs, subjunctive verbs and pretty numbers."
  end

  defp sort() do
    IO.puts "\t -s | --sort \t\tSorts the words of the text added according to the alphabet."
  end

  defp help() do
    IO.puts "\t -h | --help \t\tShows the help."
  end

  defp version() do
    IO.puts "\t -v | --version \tShows the gcli version."
  end
  defp author() do
    IO.puts "AUTHOR"
    IO.puts "\t Iván Jaimes"
    IO.puts "\t ivan@iver.mx\n"
  end
end
