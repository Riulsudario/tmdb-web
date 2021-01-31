class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :profile_params

  def index
    @profiles = current_user.profiles
  end

  def new
  end

  def create
    profile = current_user.profiles.create(profile_params)

    if profile.present?
      flash[:notice] = 'Profile created!'
      redirect_to profiles_path
    else
      flash[:alert] = 'Something wrong.'
      redirect_to new_profile_path
    end
  end

  private

  def profile_params
    params.permit(:name, :avatar)
  end
end
