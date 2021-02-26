defmodule Justinpay.Numbers do
  def sum_from_file(filename) do
    "#{filename}.csv"
    |> File.read()
    |> handle_file()
  end

  defp handle_file({:error, _err}), do: {:error, "Invalid file"}
  defp handle_file({:ok, content}) do
    result =
      content
      |> String.split(",")
      |> Stream.map(&String.to_integer/1)
      |> Enum.sum()
    {:ok, %{result: result}}
  end
end
