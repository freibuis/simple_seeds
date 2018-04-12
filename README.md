# SimpleSeed

Here at Simple were are well, quite simple. So we just love our tools simple.

This tool alls your project to load seed data for diffrent rails environments (production,development,testing).. Simple ()


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'simple_seeds'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install simple_seeds

## Usage

### Installation
To create the base setup for simple_seeds, simply run  
```bash
rails generate simple_seeds:setup
```

this will create the following files and directories into your project
`db/simple_seeds/README.md`  
`db/simple_seeds/simple_seeds.rb` this file loads custom confiruations required by your project accross environments

environments directories:  
`db/simple_seeds/environments/all/` this directory
`db/simple_seeds/environments/{Rails environments}/` each environment listed in your projects environments will be created


### Running simple_seeds

when running `rails db:seed` simple_seeds will automatically run after the rails seed file has completed

if you want to run simple_seeds on its own just run
`rails db:simple_seeds`

## Seed Files

seed files run in filename order from both the :all and your selected rails environment.
example:  
`all/001_users.rb`  
`development/001_users.rb`

the `all/001_users.rb` file will run first

example:
`all/002_users.rb`  
`development/001_users.rb`

the `development/001_users.rb` will run first


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/freibuis/simple_seeds. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the SimpleSeed project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/simple_seeds/blob/master/CODE_OF_CONDUCT.md).
