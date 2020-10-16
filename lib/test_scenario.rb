require_relative 'recipe'
require_relative 'cookbook'

tarte = Recipe.new("tarte","pommes")

csv_file   = File.join(__dir__, 'recipes.csv')
cookbook   = Cookbook.new(csv_file)

p cookbook
cookbook.add_recipe(tarte)
p cookbook
