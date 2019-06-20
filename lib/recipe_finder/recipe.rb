class Recipe

  attr_accessor :name, :description, :url, :rating, :num_of_ratings

  @@all = []

  def initialize(attributes)
    attributes.each {|key, value| self.send(("#{key}="), value)} #allows initialization with undetermined # of values
    @@all << self
  end

  def self.all
    @@all
  end

  def joins
    RecipeIngredient.all.select {|join| join.recipe == self}
  end

  def ingredients
    joins.map(&:ingredient)
  end

  def self.find_with_index(input)
    @@all.find.with_index(1) {|recipe, index|index == input} #finds recipe object by input and returns index
  end

  def find_ingredient_names
    self.ingredients.map {|ingredient| ingredient.name} #given a recipe, returns an array of ingredients
  end

end
