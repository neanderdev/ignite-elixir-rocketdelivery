defmodule Rocketdelivery.Factory do
  use ExMachina

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
end
