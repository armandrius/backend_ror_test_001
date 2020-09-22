class Season < ApplicationRecord
  include HasTitleAndPlot
  include HasNumber
  include Purchasable
  has_many :episodes, dependent: :destroy
end
