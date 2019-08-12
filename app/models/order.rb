class Order < ApplicationRecord
  belongs_to :user, optional: true

  has_many :players, inverse_of: :order
  accepts_nested_attributes_for :players
end
