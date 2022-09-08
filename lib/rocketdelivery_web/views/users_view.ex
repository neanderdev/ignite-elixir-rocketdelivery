defmodule RocketdeliveryWeb.UsersView do
  use RocketdeliveryWeb, :view

  alias Rocketdelivery.User

  def render("create.json", %{token: token, user: %User{} = user}) do
    %{
      message: "User created!",
      token: token,
      user: user
    }
  end

  def render("user.json", %{user: %User{} = user}), do: %{user: user}

  def render("sign_in.json", %{token: token}), do: %{token: token}
end
