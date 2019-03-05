# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :authors_articles_piwek,
  namespace: AAPiwek,
  ecto_repos: [AAPiwek.Repo]

# Configures the endpoint
config :authors_articles_piwek, AAPiwekWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "7/ZQI0lrSKsIiE0Rkuh0giSvGJVISR9BzmDqkfBKeNqcfnp38AtPKqGiLBf8yhIp",
  render_errors: [view: AAPiwekWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: AAPiwek.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
