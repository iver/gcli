defmodule Gcli do
  @moduledoc """
  Documentation for Gcli.
  """
  require Logger

  def main(args \\[]) do
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
      Logger.info "Ivalid args: #{inspect invalid} -> args: #{inspect args}"
    end
    Enum.each(switches, fn switch -> run(switch) end)
  end

  def run({:parse, data}) do
    Logger.info "data: #{inspect data}"
  end

  def run({:count, data}) do
    Logger.info "count: #{inspect data}"
  end

  def run({:sort, data}) do
    Logger.info "sort: #{inspect data}"
  end

  def run({:help, true}) do
    Gcli.Help.use
  end
  def run({:version, true}) do
    v = case File.read("assets/version") do
      {:ok, content} ->
         list = String.split(content, "\n")
         hd(list)
      {:error, _reason} ->
        "0.0.1"
    end
    IO.puts "Googlon version: #{v}"
  end
  def run({_, true}) do
    Gcli.Help.use
  end
end
