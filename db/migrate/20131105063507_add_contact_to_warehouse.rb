class AddContactToWarehouse < ActiveRecord::Migration
  def change
    add_column :warehouses, :contact, :string
  end
end
