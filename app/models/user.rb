class User < ApplicationRecord
  validates :name, presence: true, length: {maximum: 15}
  validates :email, presence: true, format: {with: /[\w.\-]+@[\w\-]+\.[\w.\-]+/}
  validates :password, presence: true

  has_secure_password
  validates :password, length: {minimum: 8, maximum: 32}, format: {with: /(?=.*?[a-z])(?=.*?\d)[a-z\d]/}

  has_many :cards
  has_many :orders

  mount_uploader :image, ImageUploader
end
