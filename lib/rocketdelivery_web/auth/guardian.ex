defmodule RocketdeliveryWeb.Auth.Guardian do
  use Guardian, otp_app: :rocketdelivery

  alias Rocketdelivery.User
  alias Rocketdelivery.Users.Get, as: UserGet

  def subject_for_token(%User{id: id}, _claims), do: {:ok, id}

  def resource_from_claims(%{"sub" => id}) do
    id
    |> UserGet.by_id()
  end
end
