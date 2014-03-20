class Warehouse < ActiveRecord::Base
   has_many :orders
  accepts_nested_attributes_for :orders
  attr_accessible :country, :state, :street, :phone, :city, :zip, :name, :contact
  validates_presence_of :country, :state, :street, :phone, :city, :zip, :name , :contact
end
