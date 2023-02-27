class BookingsController < ApplicationController
  before_action :new_booking, only: [:new, :create]
  # before_action :find_booking, only: [:edit, :update]

  def index
    @bookings = policy_scope(Booking).where(user_id: current_user.id)
  end

  def new
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.animal = @animal
    authorize @booking
    if @booking.save!
      redirect_to animal_bookings_path(@animal, @booking), notice: 'Thanks for booking with FarmBNB!'
    else
      render :index
    end
  end

  def edit
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def update
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.update(booking_params)
    redirect_to animal_bookings_path(@booking.animal, @booking)
  end

  def destroy
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.destroy
    redirect_to bookings_path, status: :see_other
  end

  private

  def new_booking
    @animal = Animal.find(params[:animal_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

  # def find_animal
  #   @animal = Animal.find(params[:animal_id])
  #   @booking = Booking.find(params[:id])
  # end
end
