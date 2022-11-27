class TripUser < ApplicationRecord
  belongs_to :trip, foreign_key: :trip_id, class_name: "Trip"
  belongs_to :user, foreign_key: :user_id, class_name: "User"

  amoeba do
    enable
  end
end
