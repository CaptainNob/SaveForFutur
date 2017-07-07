ActiveAdmin.register PurchaseHistory do
  permit_params :kibrilles, :euros, :user_id

  index do
    selectable_column
    column :user
    column :kibrilles
    column :created_at
    column :euros
    actions
  end
  
  filter :user
  filter :kibrilles
  filter :euros
  filter :created_at

  form do |f|
    f.inputs :user if f.object.new_record?
    f.inputs 'Purchase History Details' do
      f.input :kibrilles
      f.input :euros
    end

    f.actions
  end
end