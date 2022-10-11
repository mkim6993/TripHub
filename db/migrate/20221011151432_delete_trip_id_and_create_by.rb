class DeleteTripIdAndCreateBy < ActiveRecord::Migration[7.0]
  def change
    remove_column :trips, :trip_id
    remove_column :trips, :date_created
  end
end
