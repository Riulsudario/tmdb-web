class SuggestedController < ApplicationController
  before_action :authenticate_user!
  before_action :suggested_params
  before_action :profile

  def index
    service = Suggested::Index.call(profile: @profile)

    return @suggested = Tmdb::Movie.popular unless service.success?

    @suggested = service.result if service.result.present?
  end

  private

  def profile
    @profile = current_user.profiles[suggested_params[:p_id].to_i]
  end

  def suggested_params
    params.permit(:p_id)
  end
end
