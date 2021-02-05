class ScheduleMoviesController < ApplicationController
  before_action :authenticate_user!
  before_action :profile

  def create
    schedule_movie = @profile.schedule_movies.create(movie_id: schedule_params[:movie_id],
                                                     movie_title: schedule_params[:movie_title],
                                                     date: schedule_params[:schedule_date])

    if schedule_movie.present?
      service = ScheduleMovies::Index.call(profile: @profile, schedule: schedule_movie)

      if service.success?
        flash[:notice] = 'Movie was scheduled!'
      else
        flash[:alert] = 'Something went wrong.'
      end
    else
      flash[:alert] = 'Something went wrong.'
    end

    redirect_to p_movie_path(id: schedule_params[:movie_id])
  end

  private

  def profile
    current_user = User.first
    @profile = current_user.profiles[params[:p_id].to_i]
  end

  def schedule_params
    params.permit(:movie_id, :movie_name, :schedule_date)
  end
end
