CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: "AWS",
    aws_access_key_id: Rails.application.secrets.aws_access_key_id || "123",
    aws_secret_access_key: Rails.application.secrets.aws_secret_access_key || "123"
  }
  config.fog_directory  = Rails.application.secrets.aws_bucket || "123"
end
