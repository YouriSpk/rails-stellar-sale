class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @stars = Star.limit(9)
  end

  def dashboard
    @user = current_user
    if @user.admin
      @pending_requests = [""]
    else
      @rentals = Rental.where(user_id: @user.id)
    end
  end
end
