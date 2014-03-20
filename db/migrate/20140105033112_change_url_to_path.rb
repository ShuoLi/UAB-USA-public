class ChangeUrlToPath < ActiveRecord::Migration
  def up
    	rename_column :attachments, :url, :filepath
  end

  def down
  end
end
