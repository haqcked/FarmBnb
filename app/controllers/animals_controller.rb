class AnimalsController < ApplicationController

  def index
    @animals = Animal.all
  end

  def show
    @booking = Booking.new
    @animal = Animal.find(params[:id])
  end

end
