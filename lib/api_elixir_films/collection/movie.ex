defmodule ApiElixirFilms.Collection.Movie do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "movies" do
    field :actors, :string
    field :cover, :string
    field :directors, :string
    field :genre, :string
    field :title, :string
    field :year, :string

    timestamps()
  end

  @doc false
  def changeset(movie, attrs) do
    movie
    |> cast(attrs, [:title, :genre, :year, :directors, :actors, :cover])
    |> validate_required([:title, :genre, :year, :directors, :actors, :cover])
  end
end
