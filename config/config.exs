# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :api_elixir_films,
  ecto_repos: [ApiElixirFilms.Repo],
  generators: [binary_id: true]

# Configures the endpoint
config :api_elixir_films, ApiElixirFilmsWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "L1hssuRZjgRQc2nfAU+rA9/nmjSl3krKxd5NwkTC1I2/KPoxDEek0mpp8SV1wo3h",
  render_errors: [view: ApiElixirFilmsWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: ApiElixirFilms.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
