defmodule RocketdeliveryWeb.Auth.Pipeline do
  use Guardian.Plug.Pipeline, otp_app: :rocketdelivery

  plug Guardian.Plug.VerifyHeader
  plug Guardian.Plug.EnsureAuthenticated
  plug Guardian.Plug.LoadResource
end
