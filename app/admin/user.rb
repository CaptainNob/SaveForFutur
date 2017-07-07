ActiveAdmin.register User do
  permit_params :username, :email, :password, :password_confirmation, :admin,
                :dingdings, :kibrilles
  index do
    selectable_column
    id_column
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    column :admin
    column :kibrilles
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    #f.inputs 'User Details' do
    #  f.input :username
    #  f.input :email
    #  f.input :password
    #  f.input :password_confirmation
    #end
    
    #f.inputs 'Admin?' do
    #  f.input :admin
    #end
    
    f.inputs "User Liquidity" do
      f.input :dingdings
      f.input :kibrilles
    end
    
    f.actions
  end
end