ActiveAdmin.register Status do
	menu :label => "Status"
	index do
		column :name
		default_actions
	end
end
