class CollectionsController < ApplicationController
  before_action :authenticate_user!
  before_action :profile
  before_action :collection_params
  before_action :movies

  def show
  end

  private

  def profile
    @profile = current_user.profiles[collection_params[:p_id].to_i]
  end

  def collection_params
    params.permit(:id, :p_id)
  end

  def movies
    @collection = Tmdb::Collection.detail(collection_params[:id])
  end
end
