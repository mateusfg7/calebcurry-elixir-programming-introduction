defmodule Membership do
  defstruct [:type, :price]
end

defmodule User do
  defstruct [:name, :membership]
end

defmodule Example do
  use Application
  alias UUID

  def start(_type, _args) do
    Example.main()
    Supervisor.start_link([], strategy: :one_for_one)
  end

  def main do
    gold_membership = %Membership{type: :gold, price: 25}
    silver_membership = %Membership{type: :silver, price: 20}
    bronze_membership = %Membership{type: :bronze, price: 15}
    _none_membership = %Membership{type: :none, price: 0}

    users = [
      %User{name: "Mateus", membership: gold_membership},
      %User{name: "Felipe", membership: gold_membership},
      %User{name: "Maria", membership: silver_membership},
      %User{name: "Clara", membership: bronze_membership}
    ]

    Enum.each(users, fn %User{name: name, membership: membership} ->
      IO.puts("#{name} has a #{membership.type} membership paying #{membership.price}.")
    end)
  end
end
