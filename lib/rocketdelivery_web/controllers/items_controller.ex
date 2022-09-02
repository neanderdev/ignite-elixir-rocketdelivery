defmodule RocketdeliveryWeb.ItemsController do
  use RocketdeliveryWeb, :controller

  alias Rocketdelivery.Item
  alias RocketdeliveryWeb.FallbackController

  action_fallback FallbackController

  def create(conn, params) do
    with {:ok, %Item{} = item} <- Rocketdelivery.create_item(params) do
      conn
      |> put_status(:created)
      |> render("create.json", item: item)
    end
  end
end
