class Movie < ApplicationRecord
  include HasTitleAndPlot
  include Purchasable
end
