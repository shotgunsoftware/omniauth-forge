# frozen_string_literal: true

module OmniAuth
  module Strategies
    class Forge < OmniAuth::Strategies::OAuth2
      option :name, 'forge'

      option(
        :client_options,
        {
          site: 'https://developer.api.autodesk.com',
          authorize_url: '/authentication/v1/authorize',
          token_url: '/authentication/v1/gettoken'
        }
      )

      option :callback_path, '/forge/callback'

      uid { raw_info['userId'] }

      info do
        {
          user_name: raw_info['userName'],
          email: raw_info['emailId'],
          first_name: raw_info['firstName'],
          last_name: raw_info['lastName']
        }
      end

      extra { { 'raw_info' => raw_info } }

      # Forge is expecting a callback_url without parameters
      def callback_url
        super.gsub(/\?.*$/, '')
      end

      def raw_info
        @raw_info ||= access_token.get('/userprofile/v1/users/@me').parsed
      end
    end
  end
end
