defmodule Rocketdelivery.Factory do
  use ExMachina.Ecto, repo: Rocketdelivery.Repo

  alias Rocketdelivery.User

  def user_params_factory do
    %{
      address: "Av Teste, 11 - Centro",
      age: 18,
      cep: "12345678",
      cpf: "12345678910",
      email: "email@email.com",
      password: "123456",
      name: "Neander"
    }
  end

  def user_factory do
    %User{
      address: "Av Teste, 11 - Centro",
      age: 18,
      cep: "12345678",
      cpf: "12345678910",
      email: "email@email.com",
      password: "123456",
      name: "Neander",
      id: "6d33331d-ff45-4dcc-a50b-2341bf672591"
    }
  end
end
