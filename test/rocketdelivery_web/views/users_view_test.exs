defmodule RocketdeliveryWeb.UsersViewTest do
  use RocketdeliveryWeb.ConnCase, async: true

  import Phoenix.View
  import Rocketdelivery.Factory

  alias RocketdeliveryWeb.UsersView

  test "renders create.json" do
    user = build(:user)
    token = "xpto1234"

    response = render(UsersView, "create.json", token: token, user: user)

    assert %{
             message: "User created!",
             token: "xpto1234",
             user: %Rocketdelivery.User{
               address: "Av Teste, 11 - Centro",
               age: 18,
               cep: "12345678",
               cpf: "12345678910",
               email: "email@email.com",
               id: "6d33331d-ff45-4dcc-a50b-2341bf672591",
               inserted_at: nil,
               name: "Neander",
               password: "123456",
               password_hash: nil,
               updated_at: nil
             }
           } ==
             response
  end
end
