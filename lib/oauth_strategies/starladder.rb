require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Starladder < OmniAuth::Strategies::OAuth2

      option :name, 'starladder'

      option :client_options, {
        site:          'https://auth.starladder.com',
        authorize_url: '/oauth/authorize',
        token_url:     '/oauth/token'
      }

      uid { raw_info['id'] }

      info do
        raw_information = raw_info
      end

      extra do
        {
          'raw_info' => raw_info
        }
      end

      def raw_info
        @raw_info ||= access_token.get('/api/v1/me').parsed || {}
      end

      def callback_url
        'http://127.0.0.1:3000/auth/starladder/callback'
      end


      protected


      def build_access_token
        ###                        code, params, options
        client.auth_code.get_token(
          request.params["code"],
          { redirect_uri: callback_url }.merge(token_params.to_hash(:symbolize_keys => true)),
          deep_symbolize(options.auth_token_params)
        )
      end
    end
  end
end
