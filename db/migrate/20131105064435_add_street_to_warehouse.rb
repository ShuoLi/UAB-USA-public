class AddStreetToWarehouse < ActiveRecord::Migration
  def change
    add_column :warehouses, :street, :string
  end
end
