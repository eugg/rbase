ActiveAdmin::Editor.configure do |config|
  config.s3_bucket = ENV["AWS_BUCKET"] || Rails.application.secrets.s3_bucket
  config.aws_access_key_id = ENV["AWS_ACCESS_KEY_ID"] || Rails.application.secrets.aws_access_key_id
  config.aws_access_secret = ENV["AWS_SECRET_ACCESS_KEY"] || Rails.application.secrets.aws_access_secret
end