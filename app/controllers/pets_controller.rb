class PetsController < ApplicationController


  def index
    @pets = Pet.all
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def create
    @pet = Pet.new(pet_params)
    @pet.save

    redirect_to pet_path(@pet)
  end

  def new
    @pet = Pet.new
  end

  def save
    @pet.save
  end

  private

  def pet_params
    params.require(:pet).permit(:name, :species, :description, :price)
  end
end
