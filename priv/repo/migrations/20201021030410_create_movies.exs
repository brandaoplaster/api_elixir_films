defmodule ApiElixirFilms.Repo.Migrations.CreateMovies do
  use Ecto.Migration

  def change do
    create table(:movies, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :title, :string
      add :genre, :string
      add :year, :string
      add :directors, :string
      add :actors, :string
      add :cover, :string

      timestamps()
    end

  end
end
