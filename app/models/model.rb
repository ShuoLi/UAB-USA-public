class Model < ActiveRecord::Base
   belongs_to :manufactory
   has_many :orders
   attr_accessible :name,:manufactory_id
   validates_presence_of :name

   search_methods :manufactory_id_eq

   scope :manufactory_id_eq, lambda { |manufactory_id|
     Post.joins(:manufactories).where("manufactory_id = ?", manufactory_id)
   }
end
