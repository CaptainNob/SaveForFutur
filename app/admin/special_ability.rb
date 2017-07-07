ActiveAdmin.register SpecialAbility do
  permit_params :name, :effect

  index do
    selectable_column
    id_column
    column :name
    column :effect
    actions
  end

  filter :name
  filter :effect

  form do |f|
    f.inputs 'Special Ability Details' do
      f.input :name
      f.input :effect
    end
    
    f.actions
  end
end