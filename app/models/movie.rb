class Movie < ApplicationRecord
  include HasTitleAndPlot
  include Purchasable

  def self.all_cached
    Rails.cache.fetch 'movies', expires_in: 5.minutes do
      Movie.order :created_at
    end
  end
end
