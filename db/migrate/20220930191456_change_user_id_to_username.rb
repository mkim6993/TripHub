class ChangeUserIdToUsername < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :user_id, :username
  end
end
