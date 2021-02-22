class NotificationsController < ApplicationController
  before_action :authenticate_user!
  before_action :profile

  def view_notification
    notification = Notification.find(notification_params[:notification_id])
    notification.update(viewed: true)

    redirect_to p_movie_path(id: notification.movie_id)
  end

  private

  def profile
    @profile = current_user.profiles[params[:p_id].to_i]
  end

  def notification_params
    params.permit(:notification_id)
  end
end
