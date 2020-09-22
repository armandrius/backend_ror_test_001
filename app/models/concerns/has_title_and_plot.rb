require 'active_support/concern'

module HasTitleAndPlot
  extend ActiveSupport::Concern

  included do
    validates_presence_of :title
    validates_presence_of :plot
  end
end
