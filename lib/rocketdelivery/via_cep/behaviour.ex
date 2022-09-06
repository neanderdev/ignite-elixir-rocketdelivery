defmodule Rocketdelivery.ViaCep.Behaviour do
  alias Rocketdelivery.Error

  @typep client_result :: {:ok, map()} | {:error, Error.t()}

  @callback get_cep_info(String.t()) :: client_result
end
