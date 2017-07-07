ActiveAdmin.register KibrillesPack do
  permit_params :kibrilles, :euros#, :pack_image, :pack_image_cache, :name

  index do
    selectable_column
    # column "pack_image" do |pk|
    #   image_tag (pk.pack_image.url(:thumb)) 
    # end
    # column :name
    column :kibrilles
    column :euros
    actions
  end
  
  
  show do
    attributes_table do
      # row :pack_image do |pk|
      #  image_tag (pk.pack_image)
      # end
      row :kibrilles
      row :euros
      row :created_at
    end
  end
  
  # filter :name
  filter :kibrilles
  filter :euros

  form do |f|
    f.inputs 'Kibrilles Packs Details' do
      # f.inputs "Pack Image", :multipart => true do 
      #  f.input :pack_image, :as => :file, :hint => f.object.pack_image.present? \
      #  ? image_tag(f.object.pack_image.url(:thumb))
      #  : content_tag(:span, "Pas encore d'image")
      #  f.input :pack_image_cache, :as => :hidden 
      # end
      # f.input :name
      f.input :kibrilles
      f.input :euros
    end
    f.actions
    
  end
end