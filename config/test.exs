import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :rocketdelivery, Rocketdelivery.Repo,
  username: "postgres",
  password: "s4020",
  hostname: "localhost",
  database: "rocketdelivery_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :rocketdelivery, RocketdeliveryWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "m9L1Kdx62LKcjCHbT540iWD/tcKWFz1gaSxCfHrh6+tuDM/3aU0jTuR20YdDppfz",
  server: false

# In test we don't send emails.
config :rocketdelivery, Rocketdelivery.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
