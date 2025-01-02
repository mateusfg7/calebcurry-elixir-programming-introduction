defmodule Example do
  use Application

  def start(_type, _args) do
    IO.puts(Example.hello())
    Supervisor.start_link([], strategy: :one_for_one)
  end

  def hello do
    :hello
  end
end
