class SeasonsController < ApplicationController
  def index
    @seasons = Season.all.order(:created_at)
  end
end
