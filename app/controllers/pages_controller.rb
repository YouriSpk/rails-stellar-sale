class PagesController < ApplicationController
  def home
    @stars = Star.limit(10)
  end
end
