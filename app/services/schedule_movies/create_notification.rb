class ScheduleMovies::CreateNotification < BusinessProcess::Base
  needs :profile
  needs :schedule

  steps :create_notification

  def call
    process_steps
    @notification
  end

  private

  def create_notification
    message = "Don't forget to watch the #{schedule.movie_title} movie!"
    @notification = profile.notifications.create(message: message, movie_id: schedule.movie_id)
  end
end
