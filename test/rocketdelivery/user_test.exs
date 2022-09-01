defmodule Rocketdelivery.UserTest do
  use Rocketdelivery.DataCase, async: true

  alias Ecto.Changeset
  alias Rocketdelivery.User

  describe "changeset/2" do
    test "when all params are valid, returns a valid changeset" do
      params = %{
        address: "Av Teste, 11 - Centro",
        age: 18,
        cep: "12345678",
        cpf: "12345678910",
        email: "email@email.com",
        password: "123456",
        name: "Neander"
      }

      response = User.changeset(params)

      assert %Changeset{changes: %{name: "Neander"}, valid?: true} = response
    end

    test "when updating a changeset, returns a valid changeset with the given changes" do
      params = %{
        address: "Av Teste, 11 - Centro",
        age: 18,
        cep: "12345678",
        cpf: "12345678910",
        email: "email@email.com",
        password: "123456",
        name: "Neander"
      }

      update_params = %{name: "Name Teste", password: "123456"}

      response =
        params
        |> User.changeset()
        |> User.changeset(update_params)

      assert %Changeset{changes: %{name: "Name Teste"}, valid?: true} = response
    end

    test "when there are some error, returns an invalid changeset" do
      params = %{
        address: "Av Teste, 11 - Centro",
        age: 12,
        cep: "12345678",
        cpf: "12345678910",
        email: "email@email.com",
        password: "123",
        name: "Neander"
      }

      response = User.changeset(params)

      expected_response = %{
        age: ["must be greater than or equal to 18"],
        password: ["should be at least 6 character(s)"]
      }

      assert errors_on(response) == expected_response
    end
  end
end
