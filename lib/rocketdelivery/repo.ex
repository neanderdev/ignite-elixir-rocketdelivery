defmodule Rocketdelivery.Repo do
  use Ecto.Repo,
    otp_app: :rocketdelivery,
    adapter: Ecto.Adapters.Postgres
end
