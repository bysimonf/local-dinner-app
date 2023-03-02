class DinnersController < ApplicationController
  def index
    @dinners = Dinner.all
  end

  def locations
    @dinners = Dinner.all
    @users = User.all
    @dinners.each do |dinner|
      @markers = @users.geocoded.map do |user|
        {
          latitude: user.latitude,
          longitude: user.longitude,
          info_window_html: render_to_string(partial: "info_window", locals: { user: user, dinner: dinner })
        }
      end
    end
  end

  def new
    @dinner = Dinner.new
  end

  def create
    @dinner = Dinner.new(dinner_params)
    @user = current_user
    @dinner.user = @user

    if @dinner.save
      redirect_to dinner_path(@dinner)
    else
      render :new
    end
  end

  def show
    @dinner = Dinner.find(params[:id])
    @user = @dinner.user
    @markers = [{
      longitude: @user.longitude,
      latitude: @user.latitude,
      info_window_html: render_to_string(partial: "info_window", locals: { user: @user, dinner: @dinner })
      }]
  end

  private

  def dinner_params
    params.require(:dinner).permit(:title, :category, :description, :date)
  end
end
