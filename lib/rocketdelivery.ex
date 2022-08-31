defmodule Rocketdelivery do
  alias Rocketdelivery.Users.Create, as: UserCreate
  alias Rocketdelivery.Users.Delete, as: UserDelete
  alias Rocketdelivery.Users.Get, as: UserGet
  alias Rocketdelivery.Users.Update, as: UserUpdate

  defdelegate create_user(params), to: UserCreate, as: :call
  defdelegate delete_user(id), to: UserDelete, as: :call
  defdelegate get_user_by_id(id), to: UserGet, as: :by_id
  defdelegate update_user(params), to: UserUpdate, as: :call
end
