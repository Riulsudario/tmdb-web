class WatchlistsController < ApplicationController
  before_action :authenticate_user!
  before_action :watchlist_params
  before_action :profile
  before_action :is_on_watchedlist?

  def index
    service = Watchlists::Index.call(profile: @profile)

    return unless service.success?

    @watchlist = service.result
  end

  def new
  end

  def create
    watchlist = @profile.watchlists.create(movie_id: watchlist_params[:movie_id])

    remove_from_watchedlist(@watched) if @watched.present?

    if watchlist.present?
      flash[:notice] = 'Movie added to your Watchlist!'
    else
      flash[:alert] = 'Something went wrong.'
    end
    redirect_to p_movie_path(id: watchlist_params[:movie_id ])
  end

  def delete
    remove = @profile.watchlists.find_by(movie_id: watchlist_params[:watchlist_id]).delete
    if remove.present?
      flash[:notice] = 'Movie removed from your Watchlist!'
    else
      flash[:alert] = 'Something went wrong.'
    end
    redirect_to p_movie_path(id: watchlist_params[:movie_id ])
  end

  private

  def watchlist_params
    params.permit(:p_id, :movie_id, :watchlist_id)
  end

  def is_on_watchedlist?
    @watched = @profile.watchedlists.find_by(movie_id: watchlist_params[:movie_id])
  end

  def remove_from_watchedlist(movie)
    remove = @profile.watchedlists.find_by(movie_id: movie.movie_id).delete
  end

  def profile
    @profile = current_user.profiles[watchlist_params[:p_id].to_i]
  end
end
