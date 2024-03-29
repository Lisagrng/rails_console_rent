class BookingsController < ApplicationController
  def index
    @value = 0
    @my_bookings = Booking.where(user_id: current_user.id)
  end

  def new
    @booking = Booking.new
    @console = Console.find(params[:console_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.console = Console.find(params[:console_id])
    @booking.save
    redirect_to booking_path(@booking)
  end

  def show
    @booking = Booking.find(params[:id])
    @console = @booking.console
    if @booking.start_date == @booking.end_date
      @price = @console.price_per_day
    else
      @price = @console.price_per_day * (@booking.end_date.to_date - @booking.start_date.to_date).to_i
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_path, status: :see_other
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :price_per_day)
  end
end
