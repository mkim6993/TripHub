class CreateTrips < ActiveRecord::Migration[7.0]
  def change
    create_table :trips do |t|
      t.string :trip_id
      t.string :create_by
      t.date :date_created
      t.date :trip_date
      t.string :title
      t.string :description
      t.integer :upvotes
      t.integer :shares
      t.boolean :public

      t.timestamps
    end
  end
end
