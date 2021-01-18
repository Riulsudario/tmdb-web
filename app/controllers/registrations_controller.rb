class RegistrationsController < Devise::RegistrationsController

  def new
    @registration = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
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

end
