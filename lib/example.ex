defmodule Example do
  use Application
  alias UUID

  def start(_type, _args) do
    Example.main()
    Supervisor.start_link([], strategy: :one_for_one)
  end

  def main do
    correct = :rand.uniform(11) - 1

    guess =
      IO.gets("Guess a number between 0 and 10 (#{correct}): ")
      |> String.trim()
      |> String.to_integer()

    if guess == correct do
      IO.puts("You win!")
    else
      IO.puts("You loose!")
    end
  end
end
