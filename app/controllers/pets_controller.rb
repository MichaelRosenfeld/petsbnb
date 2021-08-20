class PetsController < ApplicationController

  def index
    # the `geocoded` scope filters only flats with coordinates (latitude & longitude)
    if params[:query].present?
      @pets = Pet.where(species: params[:query])
    else
      @pets = Pet.all
    end
    @markers = @pets.geocoded.map do |pet|
      {
        lat: pet.latitude,
        lng: pet.longitude,
        info_window: render_to_string(partial: "info_window", locals: { pet: pet })
      }
    end
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def edit
    @pet = Pet.find(params[:id])
  end

  def update
    @pet = Pet.find(params[:id])
    @pet = @pet.update(pet_params)
    redirect_to pet_path
  end

  def create
    @pet = Pet.new(pet_params)
    @pet.user = current_user
    if @pet.save!
      redirect_to pet_path(@pet)
    else
      render :new
    end
  end

  def new
    @pet = Pet.new
  end

  def save
    @pet.save
  end

  def destroy
    @pet = Pet.find(params[:id])
    @pet.destroy
    redirect_to pets_path
  end

  private

  def pet_params
    params.require(:pet).permit(:name, :species, :description, :price, :address, :photo)
  end
end
