defmodule RocketdeliveryWeb.WelcomeController do
  use RocketdeliveryWeb, :controller

  def index(conn, _params) do
    conn
    |> put_status(:ok)
    |> text("Welcome!")
  end
end
