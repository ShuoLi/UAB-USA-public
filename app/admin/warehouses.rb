ActiveAdmin.register Warehouse do
	menu :label => "Warehouse"
	form do |f|
		f.inputs do
			f.input :name
			f.input :contact
			f.input :phone
			f.input :street
			f.input :city
			f.input :state
			f.input :zip
			f.input :country
		end
		f.actions
	end
end
