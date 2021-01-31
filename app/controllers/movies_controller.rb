class MoviesController < ApplicationController
	before_action :authenticate_user!
	before_action :profile
	before_action :movie_params
	before_action :movie
	before_action :images
	before_action :cast
	before_action :trailers
	before_action :similar_movies
	before_action :collection
	before_action :movie_on_watchlist?

	def show
	end

	private

	def movie_params
		params.permit(:id)
	end

  def profile
    @profile = current_user.profiles[params[:p_id].to_i]
  end

	def movie
		@movie = Tmdb::Movie.detail(movie_params[:id])
		@movie if @movie.present?
	end

	def images
		@images = Tmdb::Movie.images(movie_params[:id])
		@images if @images.present?
	end

	def cast
		@cast = Tmdb::Movie.casts(movie_params[:id])
		@cast if @cast.present?
	end

	def trailers
		@trailers = Tmdb::Movie.trailers(movie_params[:id])
		@trailers if @trailers.present?
	end

	def similar_movies
		@similar_movies = Tmdb::Movie.similar_movies(movie_params[:id])
		@similar_movies if @similar_movies.present?
	end

	def collection
		collection = @movie['belongs_to_collection']

		return unless collection.present?

		@collection = Tmdb::Collection.detail(collection['id'])
		@collection if @collection.present?
	end

	def movie_on_watchlist?
		@movie_on_watchlist = @profile.watchlists.find_by(movie_id: movie_params[:id])
	end
end
