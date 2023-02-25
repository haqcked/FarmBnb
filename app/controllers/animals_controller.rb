class AnimalsController < ApplicationController
  before_action :authenticate_user!, except: [:index] #this is to allow users to view index page without signing in
  before_action :set_animal, only: %i[ show edit update destroy ]

  def index

    if params[:query].present?
      sql_query = <<~SQL
      animals.name @@ :query
      OR animals.description @@ :query
      OR categories.name @@ :query
      SQL
      @animals = policy_scope(Animal).joins(:category).where(sql_query, query: "%#{params[:query]}%")
    else
      @animals = policy_scope(Animal)
    end
  end

  def show
    authorize @animal # Add this line
    @booking = Booking.new(animal: @animal, user: current_user)
  end

  def new
    @animal = Animal.new
    authorize @animal
  end

  def create
    @animal = Animal.new(animal_params)
    @animal.user = current_user

    authorize @animal

    if @animal.save
      redirect_to animal_path(@animal)
    else
      render :new, status: :unprocessable_entity
    end
  end


  def edit
    authorize @animal
  end

  def update
    authorize @animal

    if @animal.update!(animal_params)
      redirect_to @animal
    else
      render :show, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @animal

    @animal.destroy
    redirect_to animals_path, status: :see_other
  end

  private

  def set_animal
    @animal = Animal.find(params[:id])
  end

  def animal_params
    params.require(:animal).permit(:name, :description, :price, :category_id, :photo)
  end
end
