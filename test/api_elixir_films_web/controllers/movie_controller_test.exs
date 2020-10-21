defmodule ApiElixirFilmsWeb.MovieControllerTest do
  use ApiElixirFilmsWeb.ConnCase

  alias ApiElixirFilms.Collection
  alias ApiElixirFilms.Collection.Movie

  @create_attrs %{
    actors: "some actors",
    cover: "some cover",
    directors: "some directors",
    genre: "some genre",
    title: "some title",
    year: "some year"
  }
  @update_attrs %{
    actors: "some updated actors",
    cover: "some updated cover",
    directors: "some updated directors",
    genre: "some updated genre",
    title: "some updated title",
    year: "some updated year"
  }
  @invalid_attrs %{actors: nil, cover: nil, directors: nil, genre: nil, title: nil, year: nil}

  def fixture(:movie) do
    {:ok, movie} = Collection.create_movie(@create_attrs)
    movie
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all movies", %{conn: conn} do
      conn = get(conn, Routes.movie_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create movie" do
    test "renders movie when data is valid", %{conn: conn} do
      conn = post(conn, Routes.movie_path(conn, :create), movie: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.movie_path(conn, :show, id))

      assert %{
               "id" => id,
               "actors" => "some actors",
               "cover" => "some cover",
               "directors" => "some directors",
               "genre" => "some genre",
               "title" => "some title",
               "year" => "some year"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.movie_path(conn, :create), movie: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update movie" do
    setup [:create_movie]

    test "renders movie when data is valid", %{conn: conn, movie: %Movie{id: id} = movie} do
      conn = put(conn, Routes.movie_path(conn, :update, movie), movie: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.movie_path(conn, :show, id))

      assert %{
               "id" => id,
               "actors" => "some updated actors",
               "cover" => "some updated cover",
               "directors" => "some updated directors",
               "genre" => "some updated genre",
               "title" => "some updated title",
               "year" => "some updated year"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, movie: movie} do
      conn = put(conn, Routes.movie_path(conn, :update, movie), movie: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete movie" do
    setup [:create_movie]

    test "deletes chosen movie", %{conn: conn, movie: movie} do
      conn = delete(conn, Routes.movie_path(conn, :delete, movie))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.movie_path(conn, :show, movie))
      end
    end
  end

  defp create_movie(_) do
    movie = fixture(:movie)
    {:ok, movie: movie}
  end
end
