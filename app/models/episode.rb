class Episode < ApplicationRecord
  include HasTitleAndPlot
  include HasNumber
  belongs_to :season
end
