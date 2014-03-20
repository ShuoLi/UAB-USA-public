class ChangeFloatToString < ActiveRecord::Migration
  def up
  	change_column :orders, :VIN, :string
  end

  def down
  	change_column :orders, :VIN, :float
  end
end
