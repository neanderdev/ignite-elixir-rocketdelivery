defmodule RocketdeliveryWeb.OrdersController do
  use RocketdeliveryWeb, :controller

  alias Rocketdelivery.Order
  alias RocketdeliveryWeb.FallbackController

  action_fallback FallbackController

  def create(conn, params) do
    with {:ok, %Order{} = order} <- Rocketdelivery.create_order(params) do
      conn
      |> put_status(:created)
      |> render("create.json", order: order)
    end
  end
end
