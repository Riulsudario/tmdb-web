class WatchedlistsController < ApplicationController
  before_action :authenticate_user!
  before_action :watchedlist_params
  before_action :profile

  def index
    service = Watchedlists::Index.call(profile: @profile)

    return unless service.success?

    @watchedlist = service.result
  end

  def new
  end

  def create
    watchedlist = @profile.watchedlists.create(movie_id: watchedlist_params[:movie_id])
    remove = @profile.watchlists.find_by(movie_id: watchedlist_params[:movie_id]).delete

    if watchedlist.present? && remove.present?
      flash[:notice] = 'Movie added to your Watchlist!'
    else
      flash[:alert] = 'Something went wrong.'
    end
    redirect_to p_movie_path(id: watchedlist_params[:movie_id ])
  end

  def delete
    remove = @profile.watchedlists.find_by(movie_id: watchedlist_params[:watchlist_id]).delete
    if remove.present?
      flash[:notice] = 'Movie removed from your Watchlist!'
    else
      flash[:alert] = 'Something went wrong.'
    end
    redirect_to p_movie_path(id: watchedlist_params[:movie_id ])
  end

  private

  def watchedlist_params
    params.permit(:p_id, :movie_id, :watchedlist_id)
  end

  def profile
    @profile = current_user.profiles[watchedlist_params[:p_id].to_i]
  end
end
