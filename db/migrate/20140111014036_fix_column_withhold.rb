class FixColumnWithhold < ActiveRecord::Migration
  def up
  	rename_column :orders, :withold, :withhold
  end

  def down
  end
end
