class AddManufactoryIdToModels < ActiveRecord::Migration
  def change
    add_column :models, :manufactory_id, :integer
  end
end
