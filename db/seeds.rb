# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user_list = [
    ['esoirot', 'esoirot@gmail.com', true, 'Passw0rd', 'Passw0rd'],
    ['bmimoun', 'bilel.mimounpro@gmail.com', true, 'Passw0rd', 'Passw0rd'],
    ['mropert', 'morgane.rm@orange.fr', true, 'Passw0rd', 'Passw0rd']
  ]

user_list.each do |username, email, admin, password, password_confirmation|
  u = User.new(username: username, email: email, admin: admin, password: password, password_confirmation: password_confirmation)
  u.confirm
  u.save
  u.create_library(card_1: 10, card_2: 6, card_7: 6, card_4: 4, card_3: 4, card_8: 2, card_9: 1, card_12: 1, card_14: 1, card_15: 1, card_16: 1)
  u.decks.create!(name: "Default Deck", card_1: 10, card_2: 6, card_7: 6, card_4: 4, card_3: 4, card_8: 2, card_9: 1, card_12: 1, card_14: 1, card_15: 1, card_16: 1)
end

capacity_list = [
  ['Récupération', 'L’unité récolte la ressource de la case. Cette ressource s’ajoute au nombre de 1 au début du tour suivant.'],
  ['Construction', 'L’unité devient un Cité de 5 PV.'],
  ['Premier Soin', 'L’unité procure 1 PV aux unités qui lui sont adjacente.'],
  ['Chirurgie', 'L’unité procure 2 PV au unités qui lui sont adjacente.'],
  ['Endurance', 'L’unité procure 1 PM au unités qui lui sont adjacente.'],
  ['Férocité', 'L’unité procure 1 PA au unité qui lui sont adjacente.'],
  ['Enrager', 'L’unité procure 1 PA et 1 PM au unité qui lui sont adjacente.'],
  ['Repousser', 'L’unité repousse une unité d’une case dans le sens directe.']
]

capacity_list.each do |name, description|
  c = SpecialAbility.new(name: name, effect: description)
  c.save
end

card_list = [
  ['app/assets/images/MMlogo.jpg', 'Péons', 1, 1, 0, 1, 0, 0, 0, SpecialAbility.find_by(id: 1), SpecialAbility.find_by(id: 2)],
  ['app/assets/images/MMlogo.jpg', 'Troufions', 1, 1, 1, 1, 1, 0, 0, nil, nil],
  ['app/assets/images/MMlogo.jpg', 'Boîtes de fer', 1, 2, 1, 1, 0, 0, 2, nil, nil],
  ['app/assets/images/MMlogo.jpg', 'Brise-fémur', 1, 1, 2, 1, 2, 0, 0, nil, nil],
  ['app/assets/images/MMlogo.jpg', 'Empaleurs franc', 2, 2, 2, 1, 2, 0, 1, nil, nil],
  ['app/assets/images/MMlogo.jpg', 'Pourfendeurs de pance', 2, 2, 3, 1, 2, 0, 2, nil, nil],
  ['app/assets/images/MMlogo.jpg', 'Dompteurs de chèvre', 1, 1, 1, 2, 0, 1, 0, nil, nil],
  ['app/assets/images/MMlogo.jpg', 'Monteurs de sanglier', 2, 1, 2, 2, 0, 2, 0, nil, nil],
  ['app/assets/images/MMlogo.jpg', 'Chevaucheurs de Taureau', 2, 1, 3, 2, 0, 2, 1, nil, nil],
  ['app/assets/images/MMlogo.jpg', 'Sénéchal Dudéclin', 3, 3, 2, 2, 0, 2, 3, SpecialAbility.find_by(id: 7), nil],
  ['app/assets/images/MMlogo.jpg', 'Duc Ontoire', 3, 4, 2, 1, 2, 0, 3, SpecialAbility.find_by(id: 8), nil],
  ['app/assets/images/MMlogo.jpg', 'Sir Ost Pytal', 3, 4, 1, 2, 3, 2, 0, SpecialAbility.find_by(id: 3), nil],
  ['app/assets/images/MMlogo.jpg', 'Dr Mééééé', 3, 6, 0, 1, 3, 0, 2, SpecialAbility.find_by(id: 4), nil],
  ['app/assets/images/MMlogo.jpg', 'Mère Fouettard', 3, 3, 3, 1, 2, 1, 2, SpecialAbility.find_by(id: 5), nil],
  ['app/assets/images/MMlogo.jpg', 'Contesse Terreur', 3, 2, 3, 2, 1, 2, 2, SpecialAbility.find_by(id: 6), nil],
  #Duke carte n°16
  ['app/assets/images/MMlogo.jpg', 'Duke Con', 10, 0, 0, 0, 0, 0, nil, nil]
]

# Non pris en compte de l'image
card_list.each do |image, name, rarity, health_point, attack_point, move_point, wood_cost, food_cost, iron_cost, capacity1, capacity2|
  c = Card.new(name: name,
    rarity: rarity,
    health_point: health_point,
    attack_point: attack_point,
    move_point: move_point,
    wood_cost: wood_cost,
    food_cost: food_cost,
    iron_cost: iron_cost,
    special_ability1: capacity1,
    special_ability2: capacity2)

  c.image = File.open(image)
  c.save
end

kibrillesPack_list = [
  [600, 5.99],
  [1300, 11.99],
  [2700, 23.99],
  [5500, 45.99],
  [12000, 91.99]
]

kibrillesPack_list.each do |kibrilles, euros|
  k = KibrillesPack.new(kibrilles: kibrilles, euros: euros)
  k.save
end

# kibrillesGacha_list = [
#   ['Pack Brave', 700, 6000, 0, 90, 10],
#   ['Pack Champion', 1000, 9000, 0, 70, 30],
#   ['Pack Héros', 10000, 90000, 0, 0, 100]
# ]

# kibrillesGacha_list.each do |name, cost, cost10, pourcentRk1, pourcentRk2, pourcentRk3|
#   k = KibrillesGacha.new(name: name, cost: cost, cost10: cost10, pourcentRk1: pourcentRk1, pourcentRk2: pourcentRk2, pourcentRk3: pourcentRk3)
#   k.save
# end

# dingdingGacha_list = [
#   ['Garde 1', 1000, 9000, 80, 19, 1],
#   ['Garde 2', 10000, 90000, 70, 25, 5]
# ]

# dingdingGacha_list.each do |name, cost, cost10, pourcentRk1, pourcentRk2, pourcentRk3|
#   d = DingdingGacah.new(name: name, cost: cost, cost10: cost10, pourcentRk1: pourcentRk1, pourcentRk2: pourcentRk2, pourcentRk3: pourcentRk3)
#   d.save
# end
