class ContentsController < ApplicationController
  def index
    @seasons = Season.all
    @movies = Movie.all
    @contents = (@seasons.to_a + @movies.to_a).sort_by do |content|
      content.created_at
    end
  end
end
