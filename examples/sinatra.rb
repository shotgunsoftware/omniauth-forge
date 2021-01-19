#!/usr/bin/env ruby
# frozen_string_literal: true

require 'sinatra'
require 'dotenv/load'
require 'bundler/setup'
require 'omniauth-forge'

use Rack::Session::Cookie, secret: 'abc123'

OmniAuth.config.allowed_request_methods << :get
OmniAuth.config.silence_get_warning = true

use OmniAuth::Builder do
  provider :forge,
           ENV['FORGE_CLIENT_ID'],
           ENV['FORGE_CLIENT_SECRET'],
           { client_options: { site: ENV['FORGE_API_BASE_URL'] } }
end

get '/forge/callback' do
  request.env['omniauth.auth']['info'].to_json
end

pp Sinatra::Application.routes
