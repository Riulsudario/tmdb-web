class Suggested::Index < BusinessProcess::Base
  needs :profile

  steps :find_movies

  def call
    process_steps
    @similar_movies
  end

  private

  def find_movies
    watchlist = Watchlists::Index.call(profile: profile)
    watchedlist = Watchedlists::Index.call(profile: profile)

    @watchlist = watchlist.result if watchlist.success?
    @watchedlist = watchedlist.result if watchedlist.success?

    increment_movies if @watchlist.present? || @watchedlist.present?
  end

  def increment_movies
    if @watchlist.present?
      @movies = @watchlist
      @movies << @watchedlist if @watchedlist.present?
    else
      @movies = @watchedlist if @watchedlist.present?
    end

    return unless @movies.present?

    find_similar_movies
  end

  def find_similar_movies
    @similar_movies = []

    @movies.each do |movie|
      @similar_movies << Tmdb::Movie.similar_movies(movie['id'])
    end

    @similar_movies = @similar_movies.flatten.uniq
  end

end
