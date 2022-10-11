class StarFan < ApplicationRecord
  # The user giving the follow
  belongs_to :fan, foreign_key: :fan_id, class_name: "User"

  # The user being followed
  belongs_to :star, foreign_key: :star_id, class_name: "User"
end