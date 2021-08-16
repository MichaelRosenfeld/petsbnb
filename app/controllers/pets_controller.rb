class PetsController < ApplicationController
  #belongs_to :user

  def index

    @pets = Pet.all
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def create
    @pet = Pet.new()
  end

  def new
    @pet = Pet.new
  end

  def save
    @pet.save
  end

  # def delete

  # end

  # def edit

  # end

  # def update

  # end
end
