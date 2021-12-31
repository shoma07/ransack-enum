# RansackEnum

Allow Enum values to be used in [Ransack](https://github.com/activerecord-hackery/ransack) searches.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ransack-enum', '~> 0.3'
```

And then execute:

    $ bundle install

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

### Configuration

Enable / Disable enum value search in the configuration.
Default is enabled.

```ruby
# config/initializers/ransack.rb

Ransack.configure do |config|
  # ...
end

RansackEnum.configure do |config|
  # enabled (default)
  config.enabled = true

  # disabled
  # config.enabled = false
end
```

## Feature

- Enable to convert enum i18n value to search value

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/shoma07/ransack-enum.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
