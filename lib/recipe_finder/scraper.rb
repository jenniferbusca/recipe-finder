class Scraper

  def self.scrape_recipes #scrapes recipe_list_page and recipe pages to create recipe and ingredient instances
    recipe_list_page = Nokogiri::HTML(open("https://www.bonappetit.com/recipes"))
    recipe_list_page.css("div.card-body").each do |recipe_card|
      recipe_hash = {
      :name => recipe_card.css("h1.card-hed a").children.text,
      :description => recipe_card.css("p.card-copy").children.text.strip,
      :url => recipe_card.css("h1.card-hed a").attribute("href").value,
      :rating => recipe_card.css("div.review-rating-container img.review-star").length > 0 ? recipe_card.css("div.review-rating-container img.review-star").attr("alt").value : nil,
      :num_of_ratings => recipe_card.css("div.review-rating-container").children.children.text.length > 0 ? recipe_card.css("div.review-rating-container").children.children.text : nil
      }
      recipe = Recipe.new(recipe_hash) #creating a new recipe instance with above hash
      full_url = "https://www.bonappetit.com/" + recipe.url
      recipe_page = Nokogiri::HTML(open(full_url))
      ingredients = recipe_page.css("div.keywords")
      ingredients.css("a.keyword").each do |ingredient|
        unless ingredient.children.text.include?("Recipes")
          if ingredient.attr("href").match(/(ingredient)/) != nil
            ingredient_text = ingredient.children.text
            new_ingredient = Ingredient.find_or_create_by_name(name: ingredient_text, recipe: recipe)
            new_join = RecipeIngredient.new(recipe, new_ingredient)
          end
        end
      end
    end
  end
end
