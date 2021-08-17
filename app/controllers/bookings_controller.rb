class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def create
    @booking = Booking.new
  end

  def new
    @booking = Booking.new
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
end
