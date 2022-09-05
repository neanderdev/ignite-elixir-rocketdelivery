defmodule RocketdeliveryWeb.OrdersView do
  use RocketdeliveryWeb, :view

  alias Rocketdelivery.Order

  def render("create.json", %{order: %Order{} = order}) do
    %{
      message: "Order created!",
      order: order
    }
  end
end
