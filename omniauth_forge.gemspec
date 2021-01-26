# frozen_string_literal: true

require_relative 'lib/omniauth/forge/version'

Gem::Specification.new do |spec|
  spec.name = 'omniauth-forge'
  spec.version = OmniAuth::Forge::VERSION
  spec.authors = ['Denis <Zaratan> Pasin']
  spec.email = ['denis.pasin@autodesk.com']

  spec.summary = "Connect to Autodesk's forge with omniauth strategy"
  spec.description =
    'Omniauth oauth2 strategy to connect to https://forge.autodesk.com'
  spec.homepage = 'https://github.com/shotgunsoftware/omniauth-forge'
  spec.license = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.5.0')

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage
  spec.metadata['changelog_uri'] =
    'https://github.com/shotgunsoftware/omniauth-forge/blob/main/CHANGELOG.md'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files =
    Dir.chdir(File.expand_path(__dir__)) do
      `git ls-files -z`.split("\x0").reject do |f|
        f.match(%r{^(test|spec|features)/})
      end
    end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'omniauth', '>= 2'
  spec.add_dependency 'omniauth-oauth2'
  spec.add_dependency 'zeitwerk', '~> 2'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'bundler-audit'
  spec.add_development_dependency 'dip'
  spec.add_development_dependency 'dotenv'
  spec.add_development_dependency 'faker'
  spec.add_development_dependency 'overcommit'
  spec.add_development_dependency 'prettier'
  spec.add_development_dependency 'pry-byebug'
  spec.add_development_dependency 'puma'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'rubocop-faker'
  spec.add_development_dependency 'rubocop-performance'
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'simplecov-rcov'
  spec.add_development_dependency 'sinatra'
  spec.add_development_dependency 'timecop'
  spec.add_development_dependency 'vcr'
  spec.add_development_dependency 'webmock'
  spec.add_development_dependency 'yard'
end
