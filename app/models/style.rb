class Style < ApplicationRecord
  belongs_to :user

  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :detail
    validates :image
  end
end
