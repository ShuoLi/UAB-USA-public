class Order < ActiveRecord::Base
    # attr_accessible :title, :body
    belongs_to :user
    belongs_to :model
    belongs_to :status
    has_many :attachments, :dependent => :destroy
    has_many :images, :dependent => :destroy
    belongs_to :warehouse
    accepts_nested_attributes_for :images, :allow_destroy => true
    attr_accessible :user_id ,:model_id, :status_id, :year, :color, :vin,
    :msrp, :paid, :purchase_date, :detail, :images, :invoice_number, :due_date, :premium, :deposit, :transportation, :withhold, :warehouse_id

    validates_length_of :vin, :minimum => 17, :maximum => 17
    validates :vin, :uniqueness=>true
    accepts_nested_attributes_for :attachments, :allow_destroy => true
    attr_accessible :attachments_attributes
    attr_accessible :images_attributes
    # accepts_nested_attributes_for :images_attribute, :allow_destroy => true
    # search_methods :user_id_eq

    # scope :user_id_eq, lambda { |user_id|
    #   Order.joins(:users).where("user_id = ?", user_id)
    # }

    def after_initialize
      self.purchase_date ||= Time.now
      self.msrp ||=0
      self.paid ||=0
      self.premium ||=0
      self.deposit ||=0
      self.transportation ||=0
      self.withhold ||=0
      self.invoice_number ||= Order.max(invoice_number)+1
    end


    def self.search(search)
      if search
        find(:all, conditions: ['vin || model LIKE ?', "%#{search}%"], order: "created_at DESC")
      else
        find(:all)
      end
    end

    def self.findOrders(parameters)
      condition = ""
      # parameters.each do |p|
      # condition += self.addAND(condition)
      condition += ' user_id = ' + parameters["current_user"].to_s
      
      if parameters["search_text"]
        where('vin LIKE ?', "%#{parameters["search_text"]}%").where(condition)
      else
        where(condition).order(order)
      end   
    end
end