class RemoveCostTermFrom < ActiveRecord::Migration
  def up
  	remove_column :orders, :cost
  end

  def down
  end
end
