class Watchlists::Index < BusinessProcess::Base
  needs :profile

  steps :watchlist

  def call
    process_steps
    @movies
  end

  private

  def watchlist
    @watchlist = profile.watchlists

    return unless @watchlist.present?

    find_movies
  end

  def find_movies
    @movies = []

    @watchlist.each do |movie|
      @movies << Tmdb::Movie.detail(movie.movie_id)
    end
  end

end
