defmodule Rocketdelivery.Users.CreateTest do
  use Rocketdelivery.DataCase, async: true

  import Mox
  import Rocketdelivery.Factory

  alias Rocketdelivery.{Error, User}
  alias Rocketdelivery.Users.Create
  alias Rocketdelivery.ViaCep.ClientMock

  describe "call/1" do
    test "when all params are valid, returns the user" do
      params = build(:user_params)

      expect(ClientMock, :get_cep_info, fn _cep ->
        {:ok,
         %{
           "bairro" => "",
           "cep" => "14790-000",
           "complemento" => "",
           "ddd" => "17",
           "gia" => "3220",
           "ibge" => "3517406",
           "localidade" => "Guaíra",
           "logradouro" => "",
           "siafi" => "6449",
           "uf" => "SP"
         }}
      end)

      response = Create.call(params)

      assert {:ok, %User{id: _id, age: 18, email: "email@email.com"}} = response
    end

    test "where there are invalid params, returns an error" do
      params = build(:user_params, %{"password" => "123", "age" => 15})

      response = Create.call(params)

      expected_response = %{
        age: ["must be greater than or equal to 18"],
        password: ["should be at least 6 character(s)"]
      }

      assert {:error, %Error{status: :bad_request, result: changeset}} = response

      assert errors_on(changeset) == expected_response
    end
  end
end
