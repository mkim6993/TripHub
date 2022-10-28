class Trip < ApplicationRecord
  validates :create_by,  presence: true, length: { maximum: 50 }
  validates :trip_date,  presence: true
  validates :title, presence: true, length: { maximum: 50 }
  validates :description,  presence: true, length: { maximum: 500 }
  validates :upvotes,  presence: true
  validates :shares,  presence: true
  validates :public,  presence: true
  validates :parent,  presence: true

  has_many :trip_users
  has_many :users, through: :trip_users

  has_many :trip_locations
  has_many :locations, through: :trip_locations

  def self.get_children(id)
    children = Trip.where(parent: id)
  end
  
  def self.get_all_children(id)
    children = Trip.where(parent: id)
    all_children = [children]
    all_children.each do |child_arr|
      if child_arr.length != 0
        child_arr.each do |child|
          all_children.append Trip.where(parent: child.id)
        end
      end
    end
  end

end