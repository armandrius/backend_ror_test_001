class Season < ApplicationRecord
  include HasTitleAndPlot
  include HasNumber
  include Purchasable
  has_many :episodes, dependent: :destroy

  def self.all_cached
    Rails.cache.fetch 'seasons', expires_in: 5.minutes do
      Season.order :created_at
    end
  end
end
