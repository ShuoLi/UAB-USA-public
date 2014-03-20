class User < ActiveRecord::Base
  has_many :orders
  accepts_nested_attributes_for :orders, :allow_destroy => true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :user_id, :email, :password, :password_confirmation, :remember_me, :isAdmin,  :name, :phone, :address
  # attr_accessible :title, :body


  def init
    self.isAdmin  ||= false
  end


  def is_admin?
    self.isAdmin
  end

end
