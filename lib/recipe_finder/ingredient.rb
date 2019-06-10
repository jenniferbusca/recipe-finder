class Ingredient

  attr_accessor :name, :recipe

  @@all = []

  def initialize(attributes)
    attributes.each {|key, value| self.send(("#{key}="), value)}
    @@all << self
  end

  def self.all
    @@all
  end

  # def recipes
  #   Recipe.all.select do |recipe|
  #     binding.pry
  #     recipe.ingredients.include?(self)
  #   end
  # end

  # def self.find_or_create_by_name(hash)
  #   searched_ingredient = @@all.find {|ingredient| ingredient.name == hash[:name]}
  #     binding.pry
  #   if searched_ingredient == nil
  #     return self.new(hash)
  #   end
  #   searched_ingredient
  # end

end
