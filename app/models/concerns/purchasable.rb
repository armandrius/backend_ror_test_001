require 'active_support/concern'

module Purchasable
  extend ActiveSupport::Concern

  included do
    has_many :purchase_options, as: :content, dependent: :destroy
  end
end
