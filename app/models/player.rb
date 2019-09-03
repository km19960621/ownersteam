class Player < ApplicationRecord
  validates :position_id, presence: true
  validates :card_id, presence: true

  belongs_to :order
  belongs_to :card, optional: true
  belongs_to :position, optional: true
end
