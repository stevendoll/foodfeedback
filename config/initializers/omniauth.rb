Rails.application.config.middleware.use OmniAuth::Builder do
  provider :fatsecret, Rails.application.secrets.fatsecret_consumer_key, Rails.application.secrets.fatsecret_consumer_secret
end