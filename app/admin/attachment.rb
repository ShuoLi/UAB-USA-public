ActiveAdmin.register Attachment do
  menu :label => "Attachment"
  form do |f|
    f.inputs do
      f.input :order_id, :as => :select, :collection => Order.all.map{|o| ["#{o.id}", o.id]}
      f.input :filepath, :as=>:file
      f.input :name
    end
    f.actions
  end


  index do
    column :name
    column :filepath
    column :created_at
    column :order_id
    default_actions
  end
end
