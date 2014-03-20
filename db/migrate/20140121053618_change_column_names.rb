class ChangeColumnNames < ActiveRecord::Migration
  def up
  	rename_column :orders, :MSRP, :msrp
  	rename_column :orders, :VIN, :vin
  end

  def down
  end
end
