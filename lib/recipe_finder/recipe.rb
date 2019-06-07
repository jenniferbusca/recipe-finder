class Recipe

  attr_accessor :name, :description, :url, :rating, :num_of_ratings, :ingredients

  @@all = []

  def initialize(attributes)
    attributes.each {|key, value| self.send(("#{key}="), value)} #allows initialization with undetermined # of values
    @@all << self
    @ingredients = []
  end

  def self.all
    @@all
  end

  def add_ingredient(ingredient_object)
    @ingredients << ingredient_object if ingredient_object.recipe == self #adds ingredient to a recipe object
  end

end
