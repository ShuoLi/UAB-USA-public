class RemoveAdressFromOrder < ActiveRecord::Migration
  def up
  	remove_column :orders, :shipping_address
  	remove_column :orders, :billing_address
  end

  def down
  end
end
