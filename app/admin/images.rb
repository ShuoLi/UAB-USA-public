ActiveAdmin.register Image do
	menu :label => "Image"
	form do |f|
		f.inputs do
			f.input :order_id, :as => :select, :collection => Order.all.map{|o| ["#{o.id}", o.id]}
			f.input :image, :as=>:file
			f.input :name
		end
		f.actions
	end

	index do
		column :image
		column :created_at
		column :order_id
		default_actions
	end
end
