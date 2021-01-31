class Watchedlists::Index < BusinessProcess::Base
  needs :profile

  steps :watchedlist

  def call
    process_steps
    @movies
  end

  private

  def watchedlist
    @watchedlist = profile.watchedlists

    return unless @watchedlist.present?

    find_movies
  end

  def mount_movies_id
    @movies_id = []

    @watchedlist.each do |movie|
      @movies_id << movie.movie_id
    end
  end

  def find_movies
    @movies = []

    @watchedlist.each do |movie|
      @movies << Tmdb::Movie.detail(movie.movie_id)
    end
  end

end
