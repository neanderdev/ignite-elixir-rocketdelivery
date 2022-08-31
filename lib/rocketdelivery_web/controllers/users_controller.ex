defmodule RocketdeliveryWeb.UsersController do
  use RocketdeliveryWeb, :controller

  alias Rocketdelivery.User
  alias RocketdeliveryWeb.FallbackController

  action_fallback FallbackController

  def create(conn, params) do
    with {:ok, %User{} = user} <- Rocketdelivery.create_user(params) do
      conn
      |> put_status(:created)
      |> render("create.json", user: user)
    end
  end
end
