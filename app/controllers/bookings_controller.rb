class BookingsController < ApplicationController
  def index
    @my_bookings = Booking.where(user_id: current_user.id)
  end

  def new
    @booking = Booking.new
    @console = Console.find(params[:console_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.save
    redirect_to console_bookings_path(@console)
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def destroy
    @booking = booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_path, status: :see_other
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :price_per_day)
  end
end
