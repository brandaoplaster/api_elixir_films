defmodule ApiElixirFilms.Repo do
  use Ecto.Repo,
    otp_app: :api_elixir_films,
    adapter: Ecto.Adapters.Postgres
end
