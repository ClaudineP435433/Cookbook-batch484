require 'open-uri'
require 'nokogiri'
require_relative 'recipe'

ingredient = 'chocolat'
url = "https://www.marmiton.org/recettes/recherche.aspx?type=all&aqt=#{ingredient}"

html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)
ideas = []


html_doc.search('.recipe-card').first(5).each do |element|
  # puts element.text.strip
  # puts element.attribute('href').value
  name = element.search('.recipe-card__title').text.strip
  description = element.search('.recipe-card__description').text.strip
  ideas << Recipe.new(name, description)
end

p ideas

# => Return Array of Instance de recette
