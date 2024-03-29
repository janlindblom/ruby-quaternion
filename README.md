# Quaternion

The Quaternion gem adds Quaternions to your Ruby project.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'quaternion'
```

And then execute:

```sh
bundle
```

Or install it yourself as:

```sh
gem install quaternion
```

## Usage

```ruby
# Zero quaternion
q_zero = Quaternion.zero

# Two quaternions
q_a = Quaternion.new(1,2,3,4)
a_b = Quaternion.new(5,6,7,8)

# Adding two quaternions
q_sum = q_a + q_b
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at [github.com/janlindblom/ruby-quaternion](https://github.com/janlindblom/ruby-quaternion). This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/janlindblom/ruby-quaternion/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Quaternion project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/janlindblom/ruby-quaternion/blob/master/CODE_OF_CONDUCT.md).
