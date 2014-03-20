class Manufactory < ActiveRecord::Base
  has_many :models
  has_many :orders
  attr_accessible :name
  validates_presence_of :name
end
