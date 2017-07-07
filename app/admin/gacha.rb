ActiveAdmin.register Gacha do
  permit_params :image, :image_cache, :name, :kibrilles,
  :price, :rare1, :rare2, :rare3

  index do
    selectable_column
    column "image" do |g|
      image_tag (g.image.url(:thumb)) 
    end
    column :name
    column :kibrilles
    column :price
    column :rare1
    column :rare2
    column :rare3
    actions
  end

  show do
    attributes_table do
      row :image do |g|
        image_tag (g.image)
      end
      row :name
      row :kibrilles
      row :price
      row :rare1
      row :rare2
      row :rare3
      row :created_at
    end
  end

  filter :name
  filter :kibrilles
  filter :price

  form do |f|
    f.inputs 'Kibrilles Packs Details' do
      f.inputs "Image", :multipart => true do 
        f.input :image, :as => :file, :hint => f.object.image.present? \
        ? image_tag(f.object.image.url(:thumb))
        : content_tag(:span, "Pas encore d'image")
        f.input :image_cache, :as => :hidden 
      end
      f.input :name
      f.input :kibrilles
      f.input :price
      f.input :rare1
      f.input :rare2
      f.input :rare3
    end
    
    f.actions
  end
end
