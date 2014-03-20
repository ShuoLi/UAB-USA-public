class Image < ActiveRecord::Base
  attr_accessible :image, :name
  before_create :default_name

  def default_name
    self.name ||= File.basename(image, '.*').titleize if image
  end

end
