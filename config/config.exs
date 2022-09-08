# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :rocketdelivery,
  ecto_repos: [Rocketdelivery.Repo]

config :rocketdelivery, Rocketdelivery.Users.Create, via_cep_adapter: Rocketdelivery.ViaCep.Client

config :rocketdelivery, RocketdeliveryWeb.Auth.Guardian,
  issuer: "rocketdelivery",
  secret_key: "u/m64Hf12k49AclvP+yRFL2nhlV9zNIvYpp+TuCS9VJdqa6IPCv1sNHb45R2TCxN"

config :rocketdelivery, Rocketdelivery.Repo,
  migration_primary_key: [type: :binary_id],
  migration_foreign_key: [type: :binary_id]

# Configures the endpoint
config :rocketdelivery, RocketdeliveryWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [view: RocketdeliveryWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Rocketdelivery.PubSub,
  live_view: [signing_salt: "CqjLKJy8"]

# Configures the mailer
#
# By default it uses the "Local" adapter which stores the emails
# locally. You can see the emails in your browser, at "/dev/mailbox".
#
# For production it's recommended to configure a different adapter
# at the `config/runtime.exs`.
config :rocketdelivery, Rocketdelivery.Mailer, adapter: Swoosh.Adapters.Local

# Swoosh API client is needed for adapters other than SMTP.
config :swoosh, :api_client, false

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
