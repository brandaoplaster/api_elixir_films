defmodule ApiElixirFilms.CollectionTest do
  use ApiElixirFilms.DataCase

  alias ApiElixirFilms.Collection

  describe "movies" do
    alias ApiElixirFilms.Collection.Movie

    @valid_attrs %{actors: "some actors", cover: "some cover", directors: "some directors", genre: "some genre", title: "some title", year: "some year"}
    @update_attrs %{actors: "some updated actors", cover: "some updated cover", directors: "some updated directors", genre: "some updated genre", title: "some updated title", year: "some updated year"}
    @invalid_attrs %{actors: nil, cover: nil, directors: nil, genre: nil, title: nil, year: nil}

    def movie_fixture(attrs \\ %{}) do
      {:ok, movie} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Collection.create_movie()

      movie
    end

    test "list_movies/0 returns all movies" do
      movie = movie_fixture()
      assert Collection.list_movies() == [movie]
    end

    test "get_movie!/1 returns the movie with given id" do
      movie = movie_fixture()
      assert Collection.get_movie!(movie.id) == movie
    end

    test "create_movie/1 with valid data creates a movie" do
      assert {:ok, %Movie{} = movie} = Collection.create_movie(@valid_attrs)
      assert movie.actors == "some actors"
      assert movie.cover == "some cover"
      assert movie.directors == "some directors"
      assert movie.genre == "some genre"
      assert movie.title == "some title"
      assert movie.year == "some year"
    end

    test "create_movie/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Collection.create_movie(@invalid_attrs)
    end

    test "update_movie/2 with valid data updates the movie" do
      movie = movie_fixture()
      assert {:ok, %Movie{} = movie} = Collection.update_movie(movie, @update_attrs)
      assert movie.actors == "some updated actors"
      assert movie.cover == "some updated cover"
      assert movie.directors == "some updated directors"
      assert movie.genre == "some updated genre"
      assert movie.title == "some updated title"
      assert movie.year == "some updated year"
    end

    test "update_movie/2 with invalid data returns error changeset" do
      movie = movie_fixture()
      assert {:error, %Ecto.Changeset{}} = Collection.update_movie(movie, @invalid_attrs)
      assert movie == Collection.get_movie!(movie.id)
    end

    test "delete_movie/1 deletes the movie" do
      movie = movie_fixture()
      assert {:ok, %Movie{}} = Collection.delete_movie(movie)
      assert_raise Ecto.NoResultsError, fn -> Collection.get_movie!(movie.id) end
    end

    test "change_movie/1 returns a movie changeset" do
      movie = movie_fixture()
      assert %Ecto.Changeset{} = Collection.change_movie(movie)
    end
  end
end
