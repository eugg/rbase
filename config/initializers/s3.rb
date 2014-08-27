CarrierWave.configure do |config|
  config.fog_credentials = {
      provider: "AWS",         
      aws_access_key_id: ENV["AWS_ACCESS_KEY_ID"] || "123",
      aws_secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"] || "123"
  }
  config.fog_directory  = ENV["AWS_BUCKET"] || "123"
end