class ScheduleMovies::Index < BusinessProcess::Base
  needs :profile

  steps :find_schedule,
        :schedule,
        :send_notification

  def find_schedule
    @schedule = profile.schedule_movies.order(:date).first
  end

  def schedule
    @reminder_date = DateTime.current.change(day: @schedule.date.day,
                                             year: @schedule.date.year,
                                             month: @schedule.date.month,
                                             hour: @schedule.date.hour,
                                             min: @schedule.date.min)
  end

  def send_notification
    @job_id = ScheduleMoviesWorker.perform_in(@reminder_date, push_body: 'yoy',
                                                              push_date: @reminder_date,
                                                              user_id: profile.user.id,
                                                              schedule_id: @schedule.id)
  end
end
