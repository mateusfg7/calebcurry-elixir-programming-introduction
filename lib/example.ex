defmodule Example do
  use Application

  def start(_type, _args) do
    Example.main()
    Supervisor.start_link([], strategy: :one_for_one)
  end

  def sum_and_avg(numbers) do
    sum = Enum.sum(numbers)
    average = sum / Enum.count(numbers)
    {sum, average}
  end

  def print_numbers(numbers), do: numbers |> Enum.join(" ") |> IO.puts()

  def get_numbers_from_user do
    IO.puts("Enter numbers separated by spaces: ")

    user_input = IO.gets("") |> String.trim()

    String.split(user_input, " ") |> Enum.map(&String.to_integer/1)
  end

  def main do
    numbers = get_numbers_from_user()

    print_numbers(numbers)

    {sum, avg} = sum_and_avg(numbers)

    IO.puts("The sum is #{sum}, and the average is #{avg}.")
  end
end
