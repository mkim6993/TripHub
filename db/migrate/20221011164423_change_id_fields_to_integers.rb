class ChangeIdFieldsToIntegers < ActiveRecord::Migration[7.0]
  def change
    change_column :star_fans, :fan_id, :integer,  using: 'fan_id::integer'
    change_column :star_fans, :star_id, :integer, using: 'star_id::integer'
    
    change_column :trip_locations, :location_id, :integer, using: 'location_id::integer'
    change_column :trip_locations, :trip_id, :integer, using: 'trip_id::integer'

    change_column :trip_users, :trip_id, :integer, using: 'trip_id::integer'
    change_column :trip_users, :user_id, :integer, using: 'user_id::integer'
  end
end
