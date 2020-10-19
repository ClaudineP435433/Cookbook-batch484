require 'open-uri'
require 'nokogiri'
require_relative 'view'
require_relative 'recipe'
require_relative 'scrapper'

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
    # Ask User for Description - View
    rating = @view.ask_user_for("rating")
    # Ask User for Description - View
    prep_time = @view.ask_user_for("prep_time")
    # Create a new Recipe - Recipe.new
    recipe = Recipe.new(name: name, description: description, rating: rating, prep_time: prep_time)
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

  def import
    # Ask user Keyword
    keyword = @view.ask_user_for("keyword")
    # Scrapper l'url avec le mot clé
    ideas = Scrapper.new(keyword).call
    # ideas = scrap(keyword)
    # ideas => array d'instance de recette
    # Afficher le résultat
    @view.display(ideas)
    # Demander à l'utilisateur la recette qu'il veut ajouter (index)
    index = @view.ask_for_index
    # Ajouter au cookbook
    recipe = ideas[index]
    @cookbook.add_recipe(recipe)
  end

  def mark_as_done
    # Afficher la liste des recettes
    display_recipes
    # Demander à l'utilisateur l'index de la recette à mettre à jour
    index = @view.ask_for_index
    # Trouver la recette dans le cookbook
    # recipe = @cookbook.find(index)
    # Mettre à jour la recette, uniquement la variable d'instance done
    @cookbook.mark_as_done(index)
  end

  private

  # def scrap(keyword)
  #   url = "https://www.marmiton.org/recettes/recherche.aspx?type=all&aqt=#{keyword}"
  #   html_file = open(url).read
  #   html_doc = Nokogiri::HTML(html_file)
  #   ideas = []
  #   html_doc.search('.recipe-card').first(5).each do |element|
  #     name = element.search('.recipe-card__title').text.strip
  #     description = element.search('.recipe-card__description').text.strip
  #     ideas << Recipe.new(name, description)
  #   end
  #   return ideas
  # end

  def display_recipes
    # Look for all recipes - Cookbook dans @recipes
    recipes = @cookbook.all
    # Array of recipes
    # Display of recipes - View
    @view.display(recipes)
  end


end
