# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :live_view_chat,
  ecto_repos: [LiveViewChat.Repo]

# Configures the endpoint
config :live_view_chat, LiveViewChatWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "jvqS0NdnJWohRTmKy3fXym6Iza2PEgBrgApSTi7PdFoD5v50V4nokT5/M5DVrXWe",
  render_errors: [view: LiveViewChatWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: LiveViewChat.PubSub,
  live_view: [signing_salt: "Z/vU3LYX"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
