defmodule ApiElixirFilmsWeb.MovieView do
  use ApiElixirFilmsWeb, :view
  alias ApiElixirFilmsWeb.MovieView

  def render("index.json", %{movies: movies}) do
    %{data: render_many(movies, MovieView, "movie.json")}
  end

  def render("show.json", %{movie: movie}) do
    %{data: render_one(movie, MovieView, "movie.json")}
  end

  def render("movie.json", %{movie: movie}) do
    %{id: movie.id,
      title: movie.title,
      genre: movie.genre,
      year: movie.year,
      directors: movie.directors,
      actors: movie.actors,
      cover: movie.cover}
  end
end
