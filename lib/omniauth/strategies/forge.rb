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
          token_url: '/authentication/v1/gettoken',
        }
      )

      option :callback_path, '/forge/callback'
      option :root_uri, 'https://localhost'

      uid do
        raw_info['userId']
      end

      info do
        {
          user_name: raw_info['userName'],
          email: raw_info['emailId'],
          first_name: raw_info['firstName'],
          last_name: raw_info['lastName'],
        }
      end

      extra do
        {
          'raw_info' => raw_info,
        }
      end

      def raw_info
        @raw_info ||= access_token.get('/userprofile/v1/users/@me').parsed
      end

      def initialize(app, *args, &block)
        super
        if @options&.[](:client_options)&.[](:redirect_uri) &&
           @options[:client_options][:redirect_uri] != self.class.default_options[:client_options][:redirect_uri]
          return
        end

        @options[:client_options][:redirect_uri] =
          "#{@options[:root_uri].to_s.gsub(%r{/+$}, '')}/#{options[:callback_path].to_s.gsub(%r{^/+}, '')}"
      end
    end
  end
end
