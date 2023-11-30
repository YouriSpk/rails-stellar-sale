class RentalsController < ApplicationController
  def new
    @rental = Rental.new
    @star = Star.find(params[:star_id])
  end

  def create
    start_date = params[:rental][:start_date].split(",")[0]
    end_date =  params[:rental][:start_date].split(",")[1]
    difference = (Date.parse(end_date) - Date.parse(start_date)).to_i
    @rental = Rental.new(rental_param)
    @rental.start_date = start_date
    @rental.end_date = end_date
    @star = Star.find(params[:star_id])
    @rental.star = @star
    @rental.user_id = current_user.id
    if @rental.save
      redirect_to star_path(@star)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def rental_param
    params.require(:rental).permit(:new_name)
  end
end
