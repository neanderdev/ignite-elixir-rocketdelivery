defmodule Rocketdelivery.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Rocketdelivery.Repo,
      # Start the Telemetry supervisor
      RocketdeliveryWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Rocketdelivery.PubSub},
      # Start the Endpoint (http/https)
      RocketdeliveryWeb.Endpoint,
      # Start a worker by calling: Rocketdelivery.Worker.start_link(arg)
      # {Rocketdelivery.Worker, arg}
      Rocketdelivery.Orders.ReportRunner
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Rocketdelivery.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    RocketdeliveryWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
