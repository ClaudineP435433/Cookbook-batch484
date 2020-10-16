require 'csv'
require_relative 'recipe'

class Cookbook

  def initialize(csv_file_path)
    @recipes = []
    @csv_file_path = csv_file_path
    load_csv
  end

  def add_recipe(recipe)
    @recipes << recipe
    save_csv
  end

  def destroy_recipe(index)
    @recipes.delete_at(index)
    save_csv
  end

  def all
    @recipes
  end

  private

  def load_csv
    # csv_options = { col_sep: ',', quote_char: '"', headers: :first_row }
    CSV.foreach(@csv_file_path) do |row|
      recipe = Recipe.new(row[0], row[1])
      @recipes << recipe
    end
  end

  def save_csv
    # csv_options = { col_sep: ',', force_quotes: true, quote_char: '"' }
    CSV.open(@csv_file_path, 'wb') do |csv|
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description]
      end
    end
  end

end
