class Purchase < ApplicationRecord
  TIME_TO_SEE = 2.days
  belongs_to :user
  belongs_to :purchase_option
  has_one :season, through: :purchase_option, source: :content, source_type: 'Season'
  has_one :movie, through: :purchase_option, source: :content, source_type: 'Movie'
  after_save :set_expiration_time
  validate :no_duplicates

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

  def no_duplicates
    # users can purchase a content they have already purchased in the past, only if all of the previous purchases have expired
    if self.class.where(user_id: user_id, purchase_option_id: purchase_option_id).any? { |purchase|
        purchase.remaining_time_seconds > 0 }
      errors[:purchase_option] << "has existing equivalents in your library that haven't expired yet"
    end
  end
end
