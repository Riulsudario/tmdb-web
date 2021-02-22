class ScheduledMovieMailer < ApplicationMailer
  def scheduled_movie(email, schedule)
    @resource = schedule

    subject = "Don't forget to watch the #{schedule.movie_title} movie!"

    mail(
      to: email,
      from: 'MoviesX <noreply@moviesx.com>',
      subject: subject
    )
  end
end
