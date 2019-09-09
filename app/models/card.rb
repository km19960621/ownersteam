class Card < ApplicationRecord
  validates :name, presence: true

  belongs_to :user, optional: true
  belongs_to :player, optional: true

  mount_uploader :image, ImageUploader
end
