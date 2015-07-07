# Assembly

A Ruby client library for the Project Assembly Platform.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'assembly', github: 'neonadventures/assembly-client-ruby'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install assembly

## Usage

```ruby
require 'assembly'

# create a new oauth client
assembly = Assembly.connect_oauth(ENV['ASSEMLY_TOKEN'])

# start making API calls
assembly.grade_set.list
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

This client is built automatically from a JSON Schema file and should not be edited by hand. The following rake tasks are available to easily update the client to the latest schema version...

copy a schema file over from the platform (requires platform repo to be cloned to `../platform`):

    $ bundle exec rake client:copy_schema

build a new client.rb based on the schema in `lib/assembly/schema.json`:

    $ bundle exec rake client:build

or copy and build in one step:

    $ bundle exec rake client:update

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/neonadventures/assembly-client-ruby/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
