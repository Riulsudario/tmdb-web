class BaseWorker
  include Sidekiq::Worker
  include Sidekiq::Status::Worker

  sidekiq_options retry: false

  def log(message)
    Rails.logger.info(message)
    puts(message)
  end

end
