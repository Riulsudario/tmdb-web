class WatchlistsController < ApplicationController
  before_action :authenticate_user!
  before_action :watchlist_params
  before_action :profile

  def index
    service = Watchlists::Index.call(profile: @profile)

    return unless service.success?

    @watchlist = service.result
  end

  def new
  end

  def create
    watchlist = @profile.watchlists.create(movie_id: watchlist_params[:movie_id])
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

  def profile
    @profile = current_user.profiles[watchlist_params[:p_id].to_i]
  end
end
