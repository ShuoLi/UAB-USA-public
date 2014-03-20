class AddNameToWarehouse < ActiveRecord::Migration
  def change
    add_column :warehouses, :name, :string
  end
end
