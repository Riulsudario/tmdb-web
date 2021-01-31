class RegistrationsController < Devise::RegistrationsController
  before_action :user_params

  def new
    @registration = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      create_profile

      flash[:notice] = t('views.registrations.new.registered')
      redirect_to new_user_session_url
    else
      flash[:alert] = user.errors.full_messages.first.to_s
      redirect_to new_user_registration_path
    end
  end

  private

  def user_params
    params.permit(:name, :email, :avatar, :password, :password_confirmation, :birth_date)
  end

  def first_name
    @first_name = user_params[:name].split(" ").first
  end

  def create_profile
    first_name
    current_user = User.find_by(email: user_params[:email])
    current_user.profiles.create(name: @first_name, avatar: user_params[:avatar])
  end
end
