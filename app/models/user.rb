class User < ApplicationRecord
  validates_uniqueness_of :email
  validates_presence_of :email

  has_many :purchases, dependent: :nullify
  has_many :contents, through: :purchases
end
