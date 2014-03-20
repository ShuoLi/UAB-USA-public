class AddIdsToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :model_id, :integer
    add_column :orders, :status_id, :integer
  end
end
