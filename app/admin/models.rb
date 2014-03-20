ActiveAdmin.register Model do
	menu :label => "Model"
	index do
		column :name
		column :created_at
		default_actions
	end
end
