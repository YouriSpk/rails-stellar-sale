class StarsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show,:index]
  def show
    @star = Star.find(params[:id])
  end
  def index
    @stars = Star.all
  end
end
