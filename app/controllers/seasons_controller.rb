class SeasonsController < ApplicationController
  def index
    @seasons = Season.all_cached
  end
end
