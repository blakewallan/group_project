class ExpandedController < ApplicationController
    before_action :current_user

  before_action :current_user

  def user_location

  end

  def show_meal
    @place = Meal.find_by_title(params[:id])
    p @place

    #@comments = @place.comments.all

    #if there are comments for that place_title, display them
    @comments = Comment.all.where place_title: params[:id]

    #@comments = [comments]

    render 'results/expanded_meal'
  end

  def show_shelter
    @shelter = Shelter.find_by_title(params[:id])
    # @comments = Comment.find_by place_title: params[:id]
    @comments = Comment.all.where place_title: params[:id]

    render 'results/expanded_shelter'
  end


end
