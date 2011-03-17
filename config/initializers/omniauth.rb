CONSUMER_KEY = "S475M9FPBAuZ6D2l6tAArA"
CONSUMER_SECRET = "hyfzH7JIJaht19Rg1jE2D1chKMWZKlgMAC9O63GEo"
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, CONSUMER_KEY, CONSUMER_SECRET
end
