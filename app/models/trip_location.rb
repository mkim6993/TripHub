class TripLocation < ApplicationRecord
    belongs_to :trip, foreign_key: :trip_id, class_name: "Trip"
    belongs_to :location, foreign_key: :location_id, class_name: "Location"

    amoeba do
      enable
    end
end
