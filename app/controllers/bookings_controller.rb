class BookingsController < ApplicationController
  before_action :find_animal, only: [:create]

  def index
    @bookings = Booking.where(user_id: current_user.id)
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.animal = @animal
    # raise
    if @booking.save!
      redirect_to animal_path(@animal), notice: 'Thanks for booking with FarmBNB!'
    else
      render :index
    end
  end

  # def create
  #   @animal = Animal.find(params[:animal_id])
  #   @booking = Booking.new(booking_params)
  #   # @booking.save
  #   # I DONT KNOW HOW TO PROCEED
  #   # I ALSO CANT RECALL HOW TO ACCESS THE PARAMS SO I CAN USE THE VALUES IN THE CARD
  # end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

  def find_animal
    @animal = Animal.find(params[:animal_id])
  end
end
