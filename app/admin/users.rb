ActiveAdmin.register User do
  permit_params :email, :password, :password_confirmation, role_ids: []

  index do
    selectable_column
    id_column
    column :email
    column "Roles" do |user|
      user.roles.map(&:name).join(", ")
    end
    actions
  end

  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :roles, as: :check_boxes, collection: Role.all
    end
    f.actions
  end
end
