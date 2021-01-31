class ProfilesController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @profiles = current_user.profiles
  end
end
