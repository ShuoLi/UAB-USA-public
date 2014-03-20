class Attachment < ActiveRecord::Base
  attr_accessible :filepath, :order_id, :name
  belongs_to :order
  mount_uploader :filepath, AttachmentUploader
  validates_presence_of :filepath, :order_id,  :name
  
  def filepath_name
     File.basename(filepath.path || filepath.filename) if filepath
  end
end
