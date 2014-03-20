class AddNameToManufactory < ActiveRecord::Migration
  def change
    add_column :manufactories, :name, :string
  end
end
