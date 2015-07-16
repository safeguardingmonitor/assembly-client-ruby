# Assembly


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'assembly', github: 'neonadventures/assembly-client-ruby'

```

## Usage

```ruby
Assembly.configure do |config|
  config.token = 'my_oauth_access_token'
end

api = Assembly.client
grade_set = api.grade_set.create(name: "my grade set", grades: [{name: '1', value: 1 }])
assessment_point = api.assessment_point.create(name: "my AP", grade_set_id: grade_set.id)
puts assement_point
assessment_point.name = "my modified AP"
assessment_point.save
assessment_point.delete
grade_set.delete

```

## Development

Run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).
