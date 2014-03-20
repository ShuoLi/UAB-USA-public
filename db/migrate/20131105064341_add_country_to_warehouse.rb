class AddCountryToWarehouse < ActiveRecord::Migration
  def change
    add_column :warehouses, :country, :string
  end
end
