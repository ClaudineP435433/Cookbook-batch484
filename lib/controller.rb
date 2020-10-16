require_relative 'view'
require_relative 'recipe'

class Controller

  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  def list
    display_recipes
  end

  def create
    # Ask User for Name - View
    name = @view.ask_user_for("name")
    # Ask User for Description - View
    description = @view.ask_user_for("description")
    # Create a new Recipe - Recipe.new
    recipe = Recipe.new(name, description)
    # Add recipe in Cookbook - Cookbook
    @cookbook.add_recipe(recipe)
  end

  def destroy
    # Display all Recipes
    display_recipes
    # Ask User for Recipe Index
    # Store Recipe Index
    index = @view.ask_for_index
    # Delete Recipe from Cookbook
    @cookbook.destroy_recipe(index)
  end

  private

  def display_recipes
    # Look for all recipes - Cookbook dans @recipes
    recipes = @cookbook.all
    # Array of recipes
    # Display of recipes - View
    @view.display(recipes)
  end


end
