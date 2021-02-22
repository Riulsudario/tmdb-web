class HomeController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :profile, except: [:index]

  def index
    redirect_to profiles_path if user_signed_in?

    redirect_to new_user_session_path unless user_signed_in?
  end

  def dashboard
    @movies = Tmdb::Movie.now_playing
  end

  private

  def profile
    @profile = current_user.profiles[params[:p_id].to_i]
  end
end
