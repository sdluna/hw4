class PlacesController < ApplicationController

  def index
    @places = Place.all
  end

  def show
    @place = Place.find_by({ "id" => params["id"] })
    if session["user_id"] != nil
      @entries = Entry.where({ "place_id" => @place["id"], "user_id" => session["user_id"]})
    else 
     flash["notice"] = "Sorry, you must be logged in to see your entries"
     redirect_to "/login"
    end
  end

  def new
  end

  def create
    @place = Place.new
    @place["name"] = params["name"]
    @place.save
    redirect_to "/places"
  end

end
