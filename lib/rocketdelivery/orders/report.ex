defmodule Rocketdelivery.Orders.Report do
  import Ecto.Query

  alias Rocketdelivery.{Order, Repo}

  def create(filename \\ "report.csv") do
    query = from(order in Order, order_by: order.user_id)

    Repo.transaction(fn ->
      query
      |> Repo.stream()
      |> Enum.map(fn item -> item end)
      |> IO.inspect()
    end)
  end
end
