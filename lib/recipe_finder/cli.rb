class CLI

  def call #runs program
    puts "Welcome to the Recipe Finder!"
    puts "Please wait while today's featured recipes load"
    Scraper.scrape_recipes
    main_menu
    goodbye
  end

  def list_recipes
    Recipe.all.each.with_index(1) {|recipe, i| puts "#{i}. #{recipe.name}"} #puts out each recipe name
  end

  def main_menu
    input = nil #placeholder for input variable to avoid error when input is called in next line
    until input == "exit"
      puts "Featured recipes:".colorize(:blue).underline
      list_recipes
      puts "Options:".colorize(:blue).underline
      puts "Type the #{'recipe number'.colorize(:light_blue)} to get more details on a recipe"
      puts "Type '#{'exit'.colorize(:light_blue)}' to quit the program"

      input = gets.strip.downcase #getting user input and normalizing it

      if input.to_i > 0 && input.to_i <= Recipe.all.length #converts input to an integer, must be > than 0 && < the number
        return recipe_menu(input.to_i) #calling recipe_menu with input number as an argument
      elsif input == "exit" #ends loop if exit
        return
      else
        puts "Sorry, can you double check your input? Here are your options:".colorize(:color => :white, :background => :blue) #handles invalid input
      end
    end
  end

  def recipe_menu(input)
    selected_recipe = Recipe.find_with_index(input)
    recipe_input = nil #placeholder for recipe_input variable to avoid error when called in next line
    until recipe_input == "main menu"
      puts "#{selected_recipe.name.colorize(:blue).underline}"
      puts "#{selected_recipe.description}"
      puts "Rated #{selected_recipe.rating} stars - #{selected_recipe.num_of_ratings}" unless selected_recipe.rating == nil
      puts "Recipe Options:".colorize(:blue).underline
      puts "Type '#{'see recipe'.colorize(:light_blue)}' to see the recipe in your browser"
      puts "Type '#{'ingredients'.colorize(:light_blue)}' to see all ingredients in the recipe"
      puts "Type '#{'main menu'.colorize(:light_blue)}' to see the options again or '#{'exit'.colorize(:light_blue)}' to quit the program"
      recipe_input = gets.chomp.downcase
      case recipe_input
      when "see recipe"
        system("open", "https://www.bonappetit.com/" + selected_recipe.url) #opens link in browser
      when "ingredients"
        puts "Ingredients".colorize(:blue).underline
        puts selected_recipe.find_ingredient_names
      when "exit"
        return
      when "main menu"
        return main_menu
      else
        puts "Sorry, can you double check your input?".colorize(:color => :white, :background => :blue)
      end
    end
  end

  def goodbye
    puts "Bon appetit!"
  end
end
