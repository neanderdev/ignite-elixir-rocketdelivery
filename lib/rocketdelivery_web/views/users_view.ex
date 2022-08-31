defmodule RocketdeliveryWeb.UsersView do
  use RocketdeliveryWeb, :view

  alias Rocketdelivery.User

  def render("create.json", %{user: %User{} = user}) do
    %{
      message: "User created!",
      user: user
    }
  end

  def render("show.json", %{user: %User{} = user}), do: %{user: user}
end
