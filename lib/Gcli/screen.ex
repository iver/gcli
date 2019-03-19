defmodule Gcli.Screen do
  @moduledoc """
  This module print into screen the googlon information
  """

  @doc """
  Print presposition, verbs and subjunctive verbs on the screen.

  iex> import ExUnit.CaptureIO
  iex> capture_io(fn -> Gcli.Screen.print ["sfoqmd", "rsogxd", "iygsex", "qinhmjul", "qdrulxogji", "qhmoixw", "xclpedqmi",
  ...>    "dgsloqe"]
  ...> end)
  "There are 3 preposition in the text\\nThere are 5 verbs in the text\\nThere are 3 subjunctive verbs in the text\\n"

  iex> import ExUnit.CaptureIO
  iex> capture_io(fn -> Gcli.Screen.print {:sort, ["sfoqmd", "rsogxd", "iygsex", "qinhmjul", "qdrulxogji", "qhmoixw", "xclpedqmi",
  ...>    "dgsloqe"]}
  ...> end)
  "Vocabulary list: sfoqmd xclpedqmi qhmoixw qdrulxogji qinhmjul rsogxd dgsloqe iygsex\n"

  """
  def print({:sort, words}) when is_list(words) do
    sorted = Collection.sort(words)
    result = Enum.join sorted, " "
    IO.puts "Vocabulary list: #{result}"
  end

  def print(words) when is_list(words) do
    %{preposition: count_p, verb: count_v, subjunctive: count_s} = split(words)
    IO.puts Enum.join(["There are", count_p, "preposition in the text"], " ")
    IO.puts Enum.join(["There are", count_v, "verbs in the text"], " ")
    IO.puts Enum.join(["There are", count_s, "subjunctive verbs in the text"], " ")
  end

  defp split(words) when is_list(words) do
    list = Lexicon.extract words
    {:ok, data} = Collection.group list
    Collection.count data
  end
end
