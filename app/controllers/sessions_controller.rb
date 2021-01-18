class SessionsController < Devise::SessionsController
  def new
  end

  def create
    @user = User.find_for_authentication(email: user_params[:email])

    if @user.present? && @user.valid_password?(user_params[:password])
      sign_in @user, store: true
      flash[:notice] = t('views.sessions.new.logged_in')

      redirect_to root_path
    else
      flash[:alert] = t('views.sessions.new.invalid_credentials')
      redirect_to new_user_session_path
    end
  end

  def destroy
    sign_out @user
    flash[:alert] = t('views.sessions.new.session_destroyed')
    redirect_to new_user_session_path
  end

  private

  def user_params
    params.permit(:email, :password)
  end

end
