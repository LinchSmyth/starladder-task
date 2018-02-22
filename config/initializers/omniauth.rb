module OmniAuth
  module Strategies
    autoload :Starladder, Rails.root.join('lib', 'oauth_strategies', 'starladder')
  end
end

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :starladder, ENV.fetch('STARLADDER_PUB_KEY'), ENV.fetch('STARLADDER_SECRET_KEY')
end
