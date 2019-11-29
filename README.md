# Ransack::Enum

Allow Enum values to be used in [Ransack](https://github.com/activerecord-hackery/ransack) searches.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ransack-enum',
    git: 'https://github.com/shoma07/ransack-enum.git',
    branch: 'master'
```

And then execute:

    $ bundle

## Usage

When enum is defined in ActiveRecord, the search method of ransack is redefined.
There is no need to add any special code.

```ruby
class Post < ActiveRecord::Base
  enum status: { unpublished: 0, published: 1 }
end
```

### Search by enum value.

```ruby
Post.ransack(status_eq: 'published').result.to_sql
# SELECT "posts".* FROM "posts" WHERE "posts"."status" = 1
Post.ransack(status_in: %w[unpublished published]).result.to_sql
# SELECT "posts".* FROM "posts" WHERE "posts"."status" IN (0, 1)
```

### Search with actual values as before.

```ruby
Post.ransack(status_eq: 1).result.to_sql
# SELECT "posts".* FROM "posts" WHERE "posts"."status" = 1
Post.ransack(status_in: [0, 1]).result.to_sql
# SELECT "posts".* FROM "posts" WHERE "posts"."status" IN (0, 1)
```

## Feature

- Enable / Disable in ransack configuration
- Enable to convert enum i18n value to search value

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/shoma07/ransack-enum.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
