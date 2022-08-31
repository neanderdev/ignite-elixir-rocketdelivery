defmodule RocketdeliveryWeb.FallbackController do
  use RocketdeliveryWeb, :controller

  alias Rocketdelivery.Error
  alias RocketdeliveryWeb.ErrorView

  def call(conn, {:error, %Error{status: status, result: result}}) do
    conn
    |> put_status(status)
    |> put_view(ErrorView)
    |> render("error.json", result: result)
  end
end
