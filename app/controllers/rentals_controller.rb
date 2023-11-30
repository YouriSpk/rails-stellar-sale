class RentalsController < ApplicationController
  def new
    @rental = Rental.new
    @star = Star.find(params[:star_id])
  end

  def create

    start_date = params[:rental][:start_date].split("to")[0]
    end_date =  params[:rental][:start_date].split("to")[1]
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

  def approve_request
    @rental = Rental.find(params[:id])

    # Check if the current user is an admin
    if current_user.admin?
      # Update the approved status to true
      @rental.update(approved: true)

      redirect_to dashboard_path, notice: 'Request approved successfully.'
    else
      redirect_to dashboard_path, alert: 'You do not have permission to approve requests.'
    end
  end

  private

  def rental_param
    params.require(:rental).permit(:new_name, :start_date, :end_date)
  end
end
