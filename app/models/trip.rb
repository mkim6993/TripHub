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
    if children.length != 0
      grandkids = []
      children.each do |t|
        gchild = self.get_all_children(t.id)
        if !gchild.nil?
          grandkids.append(gchild)
        end
      end
      if grandkids.length != 0
        [children, grandkids]
      else
        [children]
      end
    end
  end
end