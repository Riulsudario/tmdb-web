CarrierWave.configure do |config|
  config.storage    = :aws
  config.aws_bucket = Rails.application.credentials.dig(Rails.env.to_sym, :aws_s3, :bucket_name) || ''
  config.aws_acl    = 'public-read'

  config.aws_credentials = {
    access_key_id:     Rails.application.credentials.dig(Rails.env.to_sym, :aws_s3, :access_key_id) || '',
    secret_access_key: Rails.application.credentials.dig(Rails.env.to_sym, :aws_s3, :secret_access_key) || '',
    region:            Rails.application.credentials.dig(Rails.env.to_sym, :aws_s3, :aws_region) || ''
  }
end
