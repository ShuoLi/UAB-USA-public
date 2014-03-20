class AddStatusToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :year, :string
    add_column :orders, :color, :string
    add_column :orders, :VIN, :float
    add_column :orders, :MSRP, :float
    add_column :orders, :cost, :float
    add_column :orders, :paid, :float
    add_column :orders, :purchase_date, :date
    add_column :orders, :detail, :text
  end
end
