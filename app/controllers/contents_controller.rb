class ContentsController < ApplicationController
  def index
    @seasons = Season.all_cached
    @movies = Movie.all_cached
    @contents = Rails.cache.fetch 'contents', expires_in: 5.minutes do
      (@seasons.to_a + @movies.to_a).sort_by do |content|
        content.created_at
      end
    end
  end
end
