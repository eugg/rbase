ActiveAdmin::Editor.configure do |config|
  config.s3_bucket = ENV["AWS_BUCKET"] || "123"
  config.aws_access_key_id = ENV["AWS_ACCESS_KEY_ID"] || "234"
  config.aws_access_secret = ENV["AWS_SECRET_ACCESS_KEY"] || "234"
end