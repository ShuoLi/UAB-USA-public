class FixNameOfImage < ActiveRecord::Migration
  def up
    rename_column :images, :model_id, :order_id
  end

  def down
  end
end
