defmodule Rocketdelivery.Users.CreateTest do
  use Rocketdelivery.DataCase, async: true

  import Rocketdelivery.Factory

  alias Rocketdelivery.{Error, User}
  alias Rocketdelivery.Users.Create

  describe "call/1" do
    test "when all params are valid, returns the user" do
      params = build(:user_params)

      response = Create.call(params)

      assert {:ok, %User{id: _id, age: 18, email: "email@email.com"}} = response
    end

    test "where there are invalid params, returns an error" do
      params = build(:user_params, %{password: "123", age: 15})

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
