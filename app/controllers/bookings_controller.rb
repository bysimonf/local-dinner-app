class BookingsController < ApplicationController
  def index
    @bookings = current_user.bookings
  end

  def create
    @dinner = Dinner.find(params[:dinner_id])
    @booking = Booking.new(user: current_user, dinner: @dinner)

    if @booking.save
      redirect_to dinner_path(@dinner), notice: "Your booking has been successful!"
    else
      redirect_to dinner_path(@dinner), alert: "#{@booking.errors.messages[:dinner].first}"
    end
  end
end
