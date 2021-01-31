class SearchController < ApplicationController
  before_action :authenticate_user!
  before_action :query
  before_action :movies

  def index
  end

  private

  def search_params
    params.permit(:query)
  end

  def query
    @query = search_params[:query]
  end

  def movies
    @movies = Tmdb::Movie.find(@query)

    @popular = Tmdb::Movie.popular unless @movies.present?
  end
end
