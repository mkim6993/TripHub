class CreateStarFans < ActiveRecord::Migration[7.0]
  def change
    create_table :star_fans do |t|
      t.string :star_id
      t.string :fan_id

      t.timestamps
    end
  end
end
