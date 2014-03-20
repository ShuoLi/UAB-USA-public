class AddImageProcessedToImage < ActiveRecord::Migration
  def change
    add_column :images, :image_processed, :boolean
  end
end
