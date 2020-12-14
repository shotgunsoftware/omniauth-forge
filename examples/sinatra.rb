#!/usr/bin/env ruby
# frozen_string_literal: true

require 'sinatra'
require 'dotenv/load'
require "bundler/setup"
require "omniauth-forge"

use Rack::Session::Cookie

use OmniAuth::Builder do
  provider :forge,
           ENV['FORGE_CLIENT_ID'],
           ENV['FORGE_CLIENT_SECRET'],
           {
             client_options: { site: ENV['FORGE_API_BASE_URL'] },
             root_uri: ENV['ROOT_URI'],
           }
end

get '/forge/callback' do
  request.env["omniauth.auth"]["info"].to_json
end
