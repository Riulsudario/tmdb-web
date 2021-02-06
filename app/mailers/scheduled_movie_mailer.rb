class ScheduledMovieMailer < ApplicationMailer
  def scheduled_movie(email, movie_title)
    subject = "Don't forget to watch the #{movie_title} movie!"

    mail(
      to: email,
      from: 'MoviesX <noreply@moviesx.com>',
      subject: subject
    )
  end

end
