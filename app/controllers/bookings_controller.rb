class BookingsController < ApplicationController


  def create
    @animal = Animal.find(params[:animal_id])
    @booking = Booking.new(booking_params)
    # @booking.save
    # I DONT KNOW HOW TO PROCEED
    # I ALSO CANT RECALL HOW TO ACCESS THE PARAMS SO I CAN USE THE VALUES IN THE CARD
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end


end
