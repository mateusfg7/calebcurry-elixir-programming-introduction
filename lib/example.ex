defmodule Example do
  require Integer
  use Application

  def start(_type, _args) do
    Example.main()
    Supervisor.start_link([], strategy: :one_for_one)
  end

  def even(list), do: for(n <- list, Integer.is_even(n), do: n)

  def main do
    grades = [25, 50, 75, 100]
    new = for n <- grades, do: n + 5

    IO.inspect(new)

    new = new ++ [125]
    new = new ++ [150, 175]
    final = [5 | new]

    IO.inspect(final)

    even = final |> even()

    IO.inspect(even)
  end
end
