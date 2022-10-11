class Location < ApplicationRecord
  validates :name,  presence: true, length: { maximum: 50 }
  validates :address,  presence: true, length: { maximum: 100 }
  validates :contact, presence: true, length: { maximum: 100 }
  validates :description,  presence: true, length: { maximum: 500 }
  validates :price,  presence: true
  validates :image,  presence: true, length: { maximum: 255 }
  validates :open_times,  presence: true, length: { maximum: 100 }

  has_many :trip_locations
  has_many :trips, through: :trip_locations
end