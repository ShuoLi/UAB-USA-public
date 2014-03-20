ActiveAdmin.register Manufactory do
  menu :label => "Make"
  index do
    column :name
    column :created_at
    default_actions
  end
end
