ActiveAdmin.register Order do
  menu :label => "Order"
  form :html => { :enctype => "multipart/form-data" }do |f|
    f.inputs do
      f.input :user_id, :as => :select, :collection => User.all.map{|u| ["#{u.name}", u.id]}
      f.input :warehouse_id, :as => :select, :collection => Warehouse.all.map{|o| ["#{o.name}", o.id]}
      f.input :model, :as=>:select
      f.input :status, :as=>:select
      f.input :detail, :as=>:string
      f.input :year
      f.input :color
      f.input :vin, :as=>:string
      f.input :msrp , :as=>:string
      f.input :paid    , :as=>:string
      f.input :purchase_date, :as=>:datepicker
      f.input :invoice_number, :input_html => { :value => Order.maximum("invoice_number").to_i+1 }
      f.input :due_date, :as=>:datepicker
      f.input :premium, :as=>:string
      f.input :deposit, :as=>:string
      f.input :transportation, :as=>:string
      f.input :withhold, :as=>:string
      f.inputs do
        f.has_many :images, :allow_destroy => true, :new_record => true do |cf|
          cf.inputs "Image" do
            cf.input :image, :as=>:file
              cf.input :name
          end
        end
      end
      f.inputs do
        f.has_many :attachments,  :allow_destroy => true do |cf|
          cf.input :filepath, :as=>:file
          cf.input :name
        end
      end
    end
    f.actions
  end
  
  index do
    column :id
    column :user_name do |order|
      User.find(order.user_id).name
    end
    column "YYMV" do |order|
      order.year+" "+Manufactory.find(order.model.manufactory_id).name+" "+order.model.name+"-"+order.vin.last(6)
    end
    column :color

    column :vin
    column "MSRP" do |order|
      number_to_currency order.msrp, :unit => "&dollar;"
    end
    column :premium do |order|
      number_to_currency order.premium, :unit => "&dollar;"
    end
    column :status
    column :Invoice do |order|
       link_to "Invoice", order_path(:id=>order.id, format: "pdf")
    end
    column :Upload do |order|
       link_to "Upload", "/orders/upload/"+order.id.to_s
    end
    default_actions
  end
end
