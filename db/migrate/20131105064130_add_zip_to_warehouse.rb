class AddZipToWarehouse < ActiveRecord::Migration
  def change
    add_column :warehouses, :zip, :string
  end
end
