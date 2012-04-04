OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, "f9f54199c46691c2daaa", "08dc70a865c0b2ae4c304a8ca374b56f212013ec"
end