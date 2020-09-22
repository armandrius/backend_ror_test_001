class Purchase < ApplicationRecord
  TIME_TO_SEE = 2.days
  belongs_to :user
  belongs_to :purchase_option
  has_one :season, through: :purchase_option, source: :content, source_type: 'Season'
  has_one :movie, through: :purchase_option, source: :content, source_type: 'Movie'
  after_save :set_expiration_time

  def remaining_time_seconds
    [expires_at - created_at, 0].max.to_i
  end

  def content
    season || movie
  end

  private

  def set_expiration_time
    update_columns expires_at: created_at + TIME_TO_SEE
  end
end
