require 'scraping_helper'
require 'distance_helper'

class MainController < ApplicationController

  before_action :current_user

  def index

    # @data = ScrapingHelper.scrape "http://www.resourcehouse.com/WIN211/results.aspx?SearchID=C0395517-4B18-4E07-B6F0-7DA0AF008A98"
    # @results = ScrapingHelper.set_everything @data
    #THIS POPULATES THE DB

    # @results.each do |i|
    #   @meals = Meal.where(:title => i[:title],
    #                       :address => i[:address],
    #                       :longitude => i[:longitude],
    #                       :latitude => i[:latitude],
    #                       :phone => i[:phone],
    #                       :hours => i[:hours],
    #                       :description => i[:description],
    #                       :service => i[:service]).first_or_initialize
    # end

    # @data = ScrapingHelper.scrape
    # @results = ScrapingHelper.set_everything @data

    # @distance = DistanceHelper.haversine(47.6084921, -122.336407, 47.5999035, -122.3345959)

    #THIS POPULATES THE DB

      # @results.each do |i|
      #   @meals = Meal.create(i)
      #   @shelters = Shelter.create(i)
      # end
  end

  def show


  end

end