defmodule FizzBuzz do
  # Using external function to pattern match the result on it's params.
  def main(file_name) do
    file_name
    |> File.read()
    |> handle_file_read()
  end

  defp handle_file_read({:ok, content}) do
    result =
      content
      |> String.split(",")
      |> Enum.map(&convert_and_evaluate/1)

    {:ok, result}
  end

  defp handle_file_read({:error, message}),
    do: {:error, "Error while reading the file: #{message}"}

  defp convert_and_evaluate(element) do
    element
    |> String.to_integer()
    |> evaluate_number()
  end

  defp evaluate_number(number) when rem(number, 3) == 0 and rem(number, 5) == 0, do: :fizz_buzz
  defp evaluate_number(number) when rem(number, 3) == 0, do: :fizz
  defp evaluate_number(number) when rem(number, 5) == 0, do: :buzz
  defp evaluate_number(number), do: number
end
