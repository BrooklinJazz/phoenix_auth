# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :phoenix_auth,
  ecto_repos: [PhoenixAuth.Repo]

# Configures the endpoint
config :phoenix_auth, PhoenixAuthWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "zRmkBEjLqPwi0ENViQNXtV0MxOsOugczu+Xoi6i6nww8MiXNEP9wMlKEzkPX2Hex",
  render_errors: [view: PhoenixAuthWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: PhoenixAuth.PubSub,
  live_view: [signing_salt: "NkXgqkzL"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

config :ueberauth, Ueberauth,
  providers: [
    github: {Ueberauth.Strategy.Github, []}
  ]

config :ueberauth, Ueberauth.Strategy.Github.OAuth,
  client_id: System.get_env("GITHUB_CLIENT_ID"),
  client_secret: System.get_env("GITHUB_CLIENT_SECRET")
