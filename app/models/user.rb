class User < ApplicationRecord
  has_one_attached :image

  devise :database_authenticatable, :registerable,:recoverable, :rememberable, :validatable

  has_many :styles

  validates :name, presence: true
end
