defmodule Rocketdelivery do
  alias Rocketdelivery.Users.Create, as: UserCreate

  defdelegate create_user(params), to: UserCreate, as: :call
end
