class AddOrderIdToAttachment < ActiveRecord::Migration
  def change
    add_column :attachments, :order_id, :integer
  end
end
