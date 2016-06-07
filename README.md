# Assembly


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'assembly', github: 'assembly-edu/assembly-client-ruby'

```

## Usage

Some examples of how to pull information from the Assembly Platform API using the client Gem.

```ruby
Assembly.configure do |config|
  config.token = 'my_oauth_access_token'
end

api = Assembly.client

# Fetch all teaching groups (you may know these as classes) for the mathematics subject code.
maths_groups = api.teaching_groups.all(subject_code: 'MA')

maths_groups.each do |g|
  puts "Group Name: #{g.name}"
end

# Fetch all the students for this teaching group.
students = maths_groups.first.students(per_page: 100)

students.each do |student|
  puts "#{student.last_name}, #{student.first_name} (#{student.year_code})"
end

# ...or fetch all students filtered by year code/year group
api.students.all(year_code: '7')

```

## Development

Run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.

To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).
