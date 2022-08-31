defmodule RocketdeliveryWeb.UsersController do
  use RocketdeliveryWeb, :controller

  def create(conn, params) do
    Rocketdelivery.create_user(params)
  end
end
