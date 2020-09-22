require 'active_support/concern'

module HasNumber
  extend ActiveSupport::Concern

  included do
    validates_numericality_of :number, greater_than_or_equal_to: 0
  end
end


