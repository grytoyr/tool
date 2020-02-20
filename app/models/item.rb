class Item < ApplicationRecord

  CATEGORIES = [
    'Drill',
    'Garden',
    'Saw',
    'Hammer',
    'Painting tool',
    'Electrical tool',
    'Screwdrivers',
    'Cleaning tool',
    'Accessories',
    'Hand tool'
  ]

  belongs_to :user
  has_many :rentals, dependent: :restrict_with_error
  has_many :users, through: :rentals
  has_one_attached :photo
  validates :photo, attached: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  validates :price, presence: true
  validates :name, presence: true
  validates :category, presence: true
  validates :category, inclusion: { in: CATEGORIES }
  validates :description, presence: true

  include PgSearch::Model
  pg_search_scope :global_search,
    against: [ :name, :description, :category, :price, :address ],
    associated_against: {
      user: [ :first_name, :last_name ]
    },
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

  def unavailable_dates
    rentals.pluck(:start_date, :end_date).map do |range|
      { from: range[0], to: range[1] }
    end
  end
end
