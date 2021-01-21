class MoviesController < ApplicationController
  before_action :authenticate_user!

  def show
  	@movie = Tmdb::Movie.detail(params[:id])
  end
end
