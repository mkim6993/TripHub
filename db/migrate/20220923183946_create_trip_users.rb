class CreateTripUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :trip_users do |t|
      t.string :trip_id
      t.string :user_id

      t.timestamps
    end
  end
end
