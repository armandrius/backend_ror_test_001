class PurchaseOption < ApplicationRecord
  VIDEO_QUALITIES = %w[HD SD]
  validates_numericality_of :price, greater_than: 0
  validates_inclusion_of :video_quality, in: VIDEO_QUALITIES
  belongs_to :content, polymorphic: true
end
