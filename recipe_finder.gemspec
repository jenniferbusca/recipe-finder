
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require_relative "./lib/recipe_finder/version"

Gem::Specification.new do |spec|
  spec.name          = "recipe_finder"
  spec.version       = RecipeFinder::VERSION
  spec.authors       = ["jenniferbusca"]
  spec.email         = ["jennifer.busca@gmail.com"]
  spec.summary       = %q{Find featured recipes on bonappettit.com.}
  spec.license       = "MIT"
  spec.files         = ["lib/recipe_finder.rb", "lib/recipe_finder/cli.rb", "lib/recipe_finder/scraper.rb", "lib/recipe_finder/ingredient.rb", "lib/recipe_finder/recipe.rb"]
  spec.executables   << 'recipe-finder'

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry"
  spec.add_dependency "nokogiri"
  spec.add_dependency "colorize"

end
