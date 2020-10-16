class View

  def display(recipes)
    recipes.each_with_index do |recipe, index|
      puts "#{index + 1} - #{recipe.name} - #{recipe.description}"
    end
  end

  # def ask_for_recipe_name
  #   puts "What is the recipe name ?"
  #   return gets.chomp
  # end

  # def ask_for_recipe_description
  #     puts "What is the recipe description ?"
  #   return gets.chomp
  # end

  def ask_user_for(something)
    puts "What is the recipe #{something} ?"
    return gets.chomp
  end

  def ask_for_index
    puts "What is the recipe index ?"
    return gets.chomp.to_i - 1
  end


end
