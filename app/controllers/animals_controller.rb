class AnimalsController < ApplicationController

  def index
    @animals = Animal.all
  end

  def show
    @booking = Booking.new
    @animal = Animal.find(params[:id])
  end

  def new
    @animal = Animal.new
  end

  def create
    @animal = Animal.new(animal_params)
    @animal.user = current_user
    if @animal.save
      redirect_to animal_path(@animal)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @animal = Animal.find(params[:id])
  end

  def update
    if @animal.update(animal_params)
      redirect_to @animal, notice: "Animal was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def animal_params
    params.require(:animal).permit(:name, :description, :price, :category_id, :photo)
  end
end
