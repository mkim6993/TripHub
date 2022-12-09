class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      
      t.references :user, null: false, foreign_key: true, on_delete: :cascade
      t.references :trip, null: false, foreign_key: true, on_delete: :cascade

      t.timestamps

    end
  end
end
