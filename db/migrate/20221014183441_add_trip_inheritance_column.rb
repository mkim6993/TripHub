class AddTripInheritanceColumn < ActiveRecord::Migration[7.0]
  def change
    add_column :trips, :parent, :integer
  end
end
