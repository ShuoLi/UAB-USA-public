class AddInformationToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :billing_address, :text
    add_column :orders, :shipping_address, :text
    add_column :orders, :invoice_number, :string
    add_column :orders, :due_date, :date
    add_column :orders, :premium, :decimal
    add_column :orders, :deposit, :decimal
    add_column :orders, :transportation, :decimal
    add_column :orders, :withold, :decimal
  end
end
