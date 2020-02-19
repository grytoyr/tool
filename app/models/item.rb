class Item < ApplicationRecord
  belongs_to :user
  has_many :rentals
  has_one_attached :photo
  validates :photo, attached: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  validates :price, presence: true
  validates :name, presence: true
  validates :category, presence: true
  validates :description, presence: true
end
