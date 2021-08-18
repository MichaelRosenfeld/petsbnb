class PetsController < ApplicationController
  def index
    @pets = Pet.all
    # the `geocoded` scope filters only flats with coordinates (latitude & longitude)
    @markers = @pets.geocoded.map do |pet|
      {
        lat: pet.latitude,
        lng: pet.longitude
      }
    end
  end

  def show
    @pet = Pet.find(params[:id])
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

  private

  def pet_params
    params.require(:pet).permit(:name, :species, :description, :price, :address)
  end
end
