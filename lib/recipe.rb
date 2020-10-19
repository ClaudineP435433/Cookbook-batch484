class Recipe

  attr_reader :name, :description, :rating, :prep_time

  def initialize(attributes = {})
    @name = attributes[:name]
    @description = attributes[:description]
    @rating = attributes[:rating]
    @done = attributes[:done] || false
    @prep_time = attributes[:prep_time]
    # @done = attributes.key? :done
  end

  def done?
    @done
  end

  def mark_as_done!
    @done = true
  end

end


# Recipe.new({name: "Tarte", description: "Pomme", rating: "2"})
# Recipe.new(name: "Tarte", description: "Pomme", rating: "2")
# Recipe.new(rating: "2", name: "Tarte", description: "Pomme", done: true)
