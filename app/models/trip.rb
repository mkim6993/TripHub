class Trip < ApplicationRecord
  validates :create_by,  presence: true, length: { maximum: 50 }
  validates :trip_date,  presence: true
  validates :title, presence: true, length: { maximum: 50 }
  validates :description,  presence: true, length: { maximum: 500 }
  :upvotes
  :shares
  :public
  :parent

  has_many :trip_users
  has_many :users, through: :trip_users

  has_many :trip_locations
  has_many :locations, through: :trip_locations

  has_many :likes

  # sets upvotes and shares to 0 by default
  after_initialize :set_defaults, unless: :persisted?
  # The set_defaults will only work if the object is new

  amoeba do
    enable
  end
  
  def set_defaults
    self.upvotes  ||= 0
    self.shares ||= 0
  end

  def self.get_children(id)
    children = Trip.where(parent: id)
  end
end