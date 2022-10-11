class DeleteLocationId < ActiveRecord::Migration[7.0]
  def change
    remove_column :locations, :location_id
  end
end
