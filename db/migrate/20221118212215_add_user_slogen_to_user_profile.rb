class AddUserSlogenToUserProfile < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :user_slogen, :string
  end
end
