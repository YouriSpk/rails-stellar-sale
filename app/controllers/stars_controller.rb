class StarsController < ApplicationController
  def show
    @star = Star.find(params[:id])
  end
  def index
    @stars = Star.all
  end
end
