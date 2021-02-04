class ScheduleMoviesController < ApplicationController
  # before_action :authenticate_user!, except: [:index]
  before_action :profile

  def create
  end


  private

  def profile
    current_user = User.first
    @profile = current_user.profiles[params[:p_id].to_i]
  end
end
