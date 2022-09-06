defmodule RocketdeliveryWeb.UsersControllerTest do
  use RocketdeliveryWeb.ConnCase, async: true

  import Mox
  import Rocketdelivery.Factory

  alias Rocketdelivery.ViaCep.ClientMock

  describe "create/2" do
    test "when all params are valid, creates the user", %{conn: conn} do
      params = %{
        "address" => "Av Teste, 11 - Centro",
        "age" => 18,
        "cep" => "12345678",
        "cpf" => "12345678910",
        "email" => "email@email.com",
        "password" => "123456",
        "name" => "Neander"
      }

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

      response =
        conn
        |> post(Routes.users_path(conn, :create, params))
        |> json_response(:created)

      assert %{
               "message" => "User created!",
               "user" => %{
                 "address" => "Av Teste, 11 - Centro",
                 "age" => 18,
                 "cpf" => "12345678910",
                 "email" => "email@email.com",
                 "id" => _id
               }
             } = response
    end

    test "when there is some error, returns the error", %{conn: conn} do
      params = %{
        "password" => "123456",
        "name" => "Neander"
      }

      response =
        conn
        |> post(Routes.users_path(conn, :create, params))
        |> json_response(:bad_request)

      expected_response = %{
        "message" => %{
          "address" => ["can't be blank"],
          "age" => ["can't be blank"],
          "cep" => ["can't be blank"],
          "cpf" => ["can't be blank"],
          "email" => ["can't be blank"]
        }
      }

      assert response == expected_response
    end
  end

  describe "delete/2" do
    test "when there is a user with the given id, deletes the user", %{conn: conn} do
      id = "6d33331d-ff45-4dcc-a50b-2341bf672591"

      insert(:user)

      response =
        conn
        |> delete(Routes.users_path(conn, :delete, id))
        |> response(:no_content)

      assert response == ""
    end
  end
end
