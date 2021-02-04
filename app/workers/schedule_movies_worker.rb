class ScheduleMoviesWorker < BaseWorker
  include Sidekiq::Worker

  sidekiq_options retry: 2

  def perform(params)
    push_body = params['push_body']
    push_date = params['push_date']
    user_id = params['user_id']

    user = User.find_by(id: user_id)

    return unless user.present?

    log('---- Schedule Movies ----')
    if push_date.to_datetime > DateTime.current - 2.hours
      log("PUSH_BODY: #{push_body}, to user with email #{user.email}, at #{push_date}")
      ContactMailer.contact_created.deliver_now
      log("PUSH SENDED =======> #{DateTime.current.inspect}")
      log("SCHEDULE_ID =======> #{params['schedule_id']}")
    end
  end

end
