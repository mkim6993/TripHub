class Trip < ApplicationRecord
  validates :create_by,  presence: true, length: { maximum: 50 }
  validates :trip_date,  presence: true
  validates :title, presence: true, length: { maximum: 50 }
  validates :description,  presence: true, length: { maximum: 500 }
  validates :upvotes,  presence: true
  validates :shares,  presence: true
  validates :public,  presence: true
end