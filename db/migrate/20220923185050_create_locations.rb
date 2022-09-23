class CreateLocations < ActiveRecord::Migration[7.0]
  def change
    create_table :locations do |t|
      t.string :location_id
      t.string :name
      t.string :description
      t.string :address
      t.string :contact
      t.integer :price
      t.string :image
      t.string :open_times

      t.timestamps
    end
  end
end
