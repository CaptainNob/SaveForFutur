ActiveAdmin.register Library do
  permit_params :card_1, :card_2, :card_3, :card_4, :card_5,
                :card_6, :card_7, :card_8, :card_9, :card_10,
                :card_11, :card_12, :card_13, :card_14, :card_15,
                :card_16, :card_17, :card_18, :card_19, :card_20,
                :card_21, :card_22, :card_23, :card_24, :card_25,
                :card_26, :card_27, :card_28, :card_29, :card_30,
                :card_31, :card_32, :card_33, :card_34, :card_35,
                :card_36, :card_37, :card_38, :card_39, :card_40,
                :card_41, :card_42, :card_43, :card_44, :card_45,
                :card_46, :card_47, :card_48, :card_49, :card_50,
                :user_id

  index do
    selectable_column
    column :user
    
    actions
  end

  filter :user
  
  show do
    panel "#{library.user.username}'s Library" do
      attributes_table do
        row :user
        for i in 1..50 do
          row "card_#{i}"
        end
      end
    end
  end


# Prochaine MAJ affichage nom des cartes
  form do |f|
    f.inputs :user
    for i in 1..50 do
      f.input "card_#{i}"
    end
    
    f.actions
  end
end