class ApplicationController < ActionController::Base
  protect_from_forgery
  require 'themoviedb'

  before_action :set_config
  byebug
  Tmdb::Api.key(Rails.application.credentials.dig(Rails.env.to_sym, :tmdb_api_key))

  def set_config
  	@configuration = Tmdb::Configuration.new
  end
end
