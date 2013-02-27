class TmdbMovieWorker
  include Sidekiq::Worker

  def movie(movie_id, tmdbid)
    tm_movie = TmdbMovie.find(:id => tmdbid)
    movie = Movie.find(:id => movie_id)
    map_tmdb(movie, tm_movie)
    map_posters(movie, tm_movie.posters)
    TmdbCastWorker.map_cast_to_movie(movie, tm_movie.cast)
  end


  private
    def map_tmdb(movie, tm_movie)
      movie.title = tm_movie.title
      movie.tmdb_id = tm_movie.id
      movie.imdb_id = tm_movie.imdb_id
      movie.tmdb_url = tm_movie.tm_movie.url
      movie.released = Date.parse(tm_movie.release_date) rescue movie.released = Date.parse("1970-01-01")
      movie.year = tm_movie.released_year
      movie.overview = tm_movie.overview
      movie.save!
      map_countries(movie, tm_movie.production_countries)
    end
    def map_countries(movie, countries)
      countries.each do |country|
        c = Country.find_or_create_by(:code => country.iso_3166_1)
        c.name = country.name
        c.save
        movie.countries << c unless movie.countries.find(c)
      end
    end

    def map_posters(movie, posters)
      posters.each do |poster|
        TmdbPosterWorker.map_poster_to_movie(movie, poster)
      end
    end
end