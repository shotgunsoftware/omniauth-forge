# frozen_string_literal: true

require 'zeitwerk'

require 'omniauth'
require 'omniauth-oauth2'

# module OmniAuth
#   module Forge
#   end
# end

loader = Zeitwerk::Loader.for_gem

loader.inflector.inflect(
  'omniauth' => 'OmniAuth',
  'omniauth-forge' => 'OmniAuthForge'
)

loader.setup # ready!

module OmniAuthForge; end
