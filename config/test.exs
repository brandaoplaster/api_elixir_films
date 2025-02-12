use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :api_elixir_films, ApiElixirFilmsWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :api_elixir_films, ApiElixirFilms.Repo,
  username: "postgres",
  password: "postgres",
  database: "api_elixir_films_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
