class AddCityToWarehouse < ActiveRecord::Migration
  def change
    add_column :warehouses, :city, :string
  end
end
