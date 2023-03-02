class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @dinners = Dinner.all
  end
end
