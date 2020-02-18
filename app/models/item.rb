class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  validates :photo, attached: true
end