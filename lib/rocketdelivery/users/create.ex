defmodule Rocketdelivery.Users.Create do
  alias Rocketdelivery.{Error, Repo, User}
  alias Rocketdelivery.ViaCep.Client

  def call(%{"cep" => cep} = params) do
    changeset = User.changeset(params)

    with {:ok, %User{} = _user} <- User.build(changeset),
         {:ok, _cep_info} <- Client.get_cep_info(cep),
         {:ok, %User{}} = user <- Repo.insert(changeset) do
      user
    else
      {:error, %Error{}} = error -> error
      {:error, result} -> {:error, Error.build(:bad_request, result)}
    end
  end
end
