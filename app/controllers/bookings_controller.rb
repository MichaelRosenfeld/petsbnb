class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def create
    @pet = Pet.find(params[:pet_id])
    @booking = Booking.new(booking_params)
    @booking.pet = @pet
    @booking.user = current_user
    if @booking.save
      flash.alert = "Booking created!"
      redirect_to pet_path(@pet)
    else
      render :new
    end
  end

  def new
    @booking = Booking.new
    @pet = Pet.find(params[:pet_id])
  end

  def save
    @booking.save
  end

  #   def delete
  #   end

  #   def edit
  #   end

  #   def update
  #   end

  private

  def booking_params
    params.require(:booking).permit(:starts_at, :ends_at)
  end
end
