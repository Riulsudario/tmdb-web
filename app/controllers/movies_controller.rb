class MoviesController < ApplicationController
	before_action :authenticate_user!
	before_action :movie_params
	before_action :movie
	before_action :images
	before_action :cast
	before_action :trailers
	before_action :similar_movies

	def show
	end

	private

	def movie_params
		params.permit(:id)
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

end
