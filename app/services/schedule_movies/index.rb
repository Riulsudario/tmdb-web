class ScheduleMovies::Index < BusinessProcess::Base
  needs :profile
  needs :schedule

  steps :reminder_date,
        :send_notification

  def reminder_date
    @reminder_date = DateTime.current.change(day: schedule.date.day,
                                             year: schedule.date.year,
                                             month: schedule.date.month,
                                             hour: schedule.date.hour,
                                             min: schedule.date.min)
  end

  def send_notification
    byebug
    @job_id = ScheduleMoviesWorker.perform_in(@reminder_date, push_body: 'yoy',
                                                              push_date: @reminder_date,
                                                              user_id: profile.user.id,
                                                              schedule_id: schedule.id)
  end
end
