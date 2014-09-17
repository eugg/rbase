Rails.application.config.middleware.use OmniAuth::Builder do
  provider :weibo, Rails.application.secrets.weibo_key, Rails.application.secrets.weibo_secret
end
