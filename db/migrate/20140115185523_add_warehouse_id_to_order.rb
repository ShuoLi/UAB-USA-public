class AddWarehouseIdToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :warehouse_id, :integer
  end
end
