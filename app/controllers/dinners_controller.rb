class DinnersController < ApplicationController
  def index
    @dinners = Dinner.all
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
  end

  private

  def dinner_params
    params.require(:dinner).permit(:title, :category, :description, :date)
  end
end
