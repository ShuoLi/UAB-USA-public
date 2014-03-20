class CreateManufactories < ActiveRecord::Migration
  def change
    create_table :manufactories do |t|

      t.timestamps
    end
  end
end
