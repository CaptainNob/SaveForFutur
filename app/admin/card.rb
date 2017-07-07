ActiveAdmin.register Card do
  permit_params :image, :image_cache, :name, :rarity, :health_point,
  :attack_point, :move_point, :wood_cost, :iron_cost, :food_cost,
  :special_ability1_id, :special_ability2_id, :sell_price

  index do
    selectable_column
    id_column
    column "card_image" do |pk|
      image_tag (pk.image.url(:thumb))
    end
    column :name
    column :rarity
    column :health_point
    column :attack_point
    column :move_point
    column :wood_cost
    column :iron_cost
    column :food_cost
    column :special_ability1
    column :special_ability2
    column :sell_price
    actions
  end

  show do
    attributes_table do
      row :image do |card|
        image_tag (card.image)
      end
      row :name
      row :rarity
      row :health_point
      row :attack_point
      row :move_point
      row :wood_cost
      row :iron_cost
      row :food_cost
      row :special_ability1
      row :special_ability2
      row :sell_price
    end
  end

  filter :name
  filter :rarity
  filter :health_point
  filter :attack_point
  filter :move_point
  filter :wood_cost
  filter :iron_cost
  filter :food_cost
  filter :special_ability1
  filter :special_ability2
  filter :sell_price

  form do |f|
    f.inputs 'Card Details' do
      f.inputs "Card Image", :multipart => true do 
        f.input :image, :as => :file, :hint => f.object.image.present? \
        ? image_tag(f.object.image.url(:thumb))
        : content_tag(:span, "Pas encore d'image")
        f.input :image_cache, :as => :hidden 
      end
      f.input :name
      f.input :rarity
      f.input :health_point
      f.input :attack_point
      f.input :move_point
      f.input :sell_price
    end
    
    f.inputs 'Resources Cost' do
      f.input :wood_cost
      f.input :iron_cost
      f.input :food_cost
    end
    
    f.inputs 'Special Abilities' do
      f.input :special_ability1
      f.input :special_ability2
    end
    
    f.actions
  end
end
