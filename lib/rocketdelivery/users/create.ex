defmodule Rocketdelivery.Users.Create do
  alias Rocketdelivery.{Repo, User}

  def call(params) do
    params
    |> User.changeset()
    |> Repo.insert()
  end
end
