class AnimalsController < ApplicationController
  # this is to allow users to view index page without signing in
  before_action :authenticate_user!, except: [:index]
  before_action :set_animal, only: %i[show edit update destroy]

  def index
    @animals = Animal.all
    @markers = @animals.geocoded.map do |animal|
      {
        lat: animal.latitude,
        lng: animal.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {animal: animal})
      }
    end

    if params[:query].present?
      @animals = policy_scope(Animal).global_search(params[:query])
    else
      @animals = policy_scope(Animal)
    end
  end

  def show
    # authorize @animal
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
    # authorize @animal
  end

  def update
    # authorize @animal
    if @animal.update!(animal_params)
      redirect_to @animal
    else
      render :show, status: :unprocessable_entity
    end
  end

  def destroy
    # authorize @animal
    @animal.destroy
    redirect_to animals_path, status: :see_other
  end

  private

  def set_animal
    @animal = Animal.find(params[:id])
    authorize @animal
  end

  def animal_params
    params.require(:animal).permit(:name, :description, :price, :category_id, :photo, :address)
  end
end
