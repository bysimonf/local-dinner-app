class DinnersController < ApplicationController
  def index
    @dinners = Dinner.all
  end

  def new
    @dinner = Dinner.new
  end

  def create
  end

  def show
  end
end
