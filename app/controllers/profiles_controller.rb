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
      flash[:alert] = 'Something went wrong.'
      redirect_to new_profile_path
    end
  end

  def delete
    profile = Profile.find(profile_params[:profile_id])

    profile.destroy

    flash[:notice] = 'Profile deleted!'
    redirect_to profiles_path
  end

  private

  def profile_params
    params.permit(:name, :avatar, :profile_id)
  end
end
