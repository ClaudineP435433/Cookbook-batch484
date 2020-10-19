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

  def find(index)
    @recipes[index]
  end

  def mark_as_done(index)
    recipe = find(index)
    recipe.mark_as_done!
    save_csv
  end

  private

  def load_csv
    csv_options = { col_sep: ',', quote_char: '"', headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file_path, csv_options) do |row|
      # done ?
      # if row[3] == "true"
      #   done = true
      # else
      #   done = false
      # end
      # done = ( row[3] == "true" ? true : false )
      row[:done] = row[:done] == "true"
      row[:rating] = row[:rating].to_f
      # recipe = Recipe.new(name: row[:name], description: row[:description], rating: row[:rating], done: row[:done], prep_time: row[:prep_time])
      recipe = Recipe.new(row)
      @recipes << recipe
    end
  end

  def save_csv
    csv_options = { col_sep: ',', force_quotes: true, quote_char: '"' }
    CSV.open(@csv_file_path, 'wb', csv_options) do |csv|
      csv << ["name", "description", "rating", "done", "prep_time"]
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description, recipe.rating, recipe.done?, recipe.prep_time]
      end
    end
  end

end
