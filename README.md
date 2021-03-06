# Omniauth::Forge

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/omniauth/forge`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'omniauth-forge'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install omniauth-forge

## CVE

See [Omniauth Wiki](https://github.com/omniauth/omniauth/wiki/Resolving-CVE-2015-9284). 
There's an existing unfixed CVE on omniauth. This CVE is mitigated in Rails by using the gem [omniauth-rails_csrf_protection](https://github.com/cookpad/omniauth-rails_csrf_protection).
This gem will depend on that gem in order to protect as many people as possible.

### Using bundle audit

Since the gem will be used by default you can ignore bundle audit warnings this way:
```sh
bundle audit check --ignore CVE-2015-9284
```

## Usage

This is a provider for [omniauth](https://github.com/omniauth/omniauth) based on oauth2 [3-legged forge authentication](https://forge.autodesk.com/en/docs/oauth/v2/tutorials/get-3-legged-token/). Basic usage is:

```ruby
provider(
  :forge,
  'FORGE_CLIENT_ID',
  'FORGE_CLIENT_SECRET',
  {
    callback_path: '/forge/callback' # default
  }
)
```

### Configuration options

- **callback_path**: This is the path used for the callback from forge. Default will be '/forge/callback' but you can set it to anything defined on the forge side.

### Examples

- [Basic Sinatra](./examples/sinatra.rb)

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/denispasin/omniauth-forge. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/denispasin/omniauth-forge/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Omniauth::Forge project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/denispasin/omniauth-forge/blob/master/CODE_OF_CONDUCT.md).
