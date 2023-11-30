class StarsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show,:index]
  def show
    @star = Star.find(params[:id])
    @rental = Rental.new
  end

  def index
    @stars = Star.all
  end

  def new
    @star = Star.new
  end

  def create
    @star = Star.new(star_params)
    @star.user_id = current_user.id
    if @star.save
      redirect_to stars_path, notice: 'Star was successfully created.'
    else
      flash.now[:alert] = 'Failed to create star. Please fix the errors below.'
      render :new
    end
  end

  private

  def star_params
    params.require(:star).permit(:initial_name, :price, :category, :distance_from_earth_in_light_years, :spectral_class)
  end

end
