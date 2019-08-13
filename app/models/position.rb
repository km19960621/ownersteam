class Position < ApplicationRecord
  belongs_to :player, optional: true
end
