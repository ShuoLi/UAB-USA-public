ActiveAdmin.register User do
  menu :label => "User"
  index do
    column :id
    column :email
    column :isAdmin
    column :name
    column :phone
    column :address
    default_actions
  end

  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :isAdmin, :as => :select
      f.input :name
      f.input :phone
      f.input :address
    end
    f.buttons
  end
end
