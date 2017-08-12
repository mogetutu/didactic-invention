# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :elixir_app,
  ecto_repos: [ElixirApp.Repo]

# Configures the endpoint
config :elixir_app, ElixirApp.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Aieq5sHDgb25McrYeUnaPILf0uLDEnOCniwT4Y1vgjCqDCnI+jy1LwzYGrQdfOdF",
  render_errors: [view: ElixirApp.ErrorView, accepts: ~w(html json)],
  pubsub: [name: ElixirApp.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Configure guardian
config :guardian, Guardian,
  issuer: "ElixirApp.#{Mix.env}",
  ttl: {30, :days},
  verify_issuer: true,
  serializer: ElixirApp.GuardianSerializer,
  secret_key: to_string(Mix.env) <> "SuPerseCret_aBraCadabrA"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
