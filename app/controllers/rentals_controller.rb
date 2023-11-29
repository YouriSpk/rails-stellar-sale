class RentalsController < ApplicationController
  def new
    @rental = Rental.new
    @star = Star.find(params[:star_id])
  end

  def create
    @rental = Rental.new(rental_param)
    @star = Star.find(params[:star_id])
    @rental.star = @star
    @rental.user_id = current_user
    if @rental.save
      # redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def rental_param
    params.require(:rental).permit(:new_name, :start_date, :end_date)
  end
end
