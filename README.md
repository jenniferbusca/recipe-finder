# RecipeFinder

Welcome to your the Recipe Finder! Once you launch the program, you'll be able to search through Bon Appetit's featured recipes. Once you select a recipe, you'll be able to see descriptions, ratings and ingredients.

## Installation

<!-- 1) After forking and cloning this to your own repository, open up your command line tool and navigate to your new directory.
2) Before starting the program, run "bundle install". This should install all of the required gems needed to run the application -->
Add this line to your application's Gemfile:
```ruby
gem 'recipe_finder'
```
And then execute:
    $ bundle
Or install it yourself as:
    $ gem install recipe_finder
## Usage

1) To launch the program, input the following into your command line : "recipe-finder"
2) You'll be presented with a list of featured recipes.
  From here you'll have two options:
  * Type "exit" to quit the program
  * Type "description" to get more information on a particular recipe. You'll see a brief description of the recipe and if available, ratings.
  You'll then have the following Options:
      * Type "see recipe" to launch the recipe in your browser
      * Type "ingredients" to see a list of Ingredients
      * Type "exit" to quit the program.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jenniferbusca/recipe_finder. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the RecipeFinder project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/jenniferbusca/recipe_finder/blob/master/CODE_OF_CONDUCT.md).
