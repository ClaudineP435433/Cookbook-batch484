require 'open-uri'
require 'nokogiri'
require_relative 'recipe'

class Scrapper
  def initialize(keyword)
    @keyword = keyword
  end

  def call
    url = "https://www.marmiton.org/recettes/recherche.aspx?type=all&aqt=#{@keyword}"
    html_file = open(url).read
    html_doc = Nokogiri::HTML(html_file)
    ideas = []
    html_doc.search('.recipe-card').first(5).each do |element|
      name = element.search('.recipe-card__title').text.strip
      description = element.search('.recipe-card__description').text.strip
      rating = element.search('.recipe-card__rating__value').text.strip
      ideas << Recipe.new(name: name, description: description, rating: rating)
    end
    return ideas
  end
end
