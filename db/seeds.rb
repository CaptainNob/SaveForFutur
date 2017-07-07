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
  u = User.new(
    username: username,
    email: email,
    admin: admin,
    password: password,
    password_confirmation: password_confirmation
  )
  u.confirm
  u.save
  u.create_library(
    card_1: 10, card_2: 6, card_3: 4, card_4: 4, card_7: 6,
    card_8: 2, card_9: 1, card_12: 1, card_14: 1, card_15: 1,
    card_16: 1
  )
  u.decks.create!(
    name: "Default Deck",
    card_1: 10, card_2: 6, card_3: 4, card_4: 4, card_7: 6,
    card_8: 2, card_9: 1, card_12: 1, card_14: 1, card_15: 1,
    card_16: 1
  )
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
  c = SpecialAbility.new(
    name: name,
    effect: description
  )
  c.save
end

card_list = [
  ['app/assets/images/card_01.png', 'Péons', 1, 1, 0, 1, 0, 0, 0, SpecialAbility.find_by(id: 1), nil, 100],
  ['app/assets/images/card_02.png', 'Troufions', 1, 1, 1, 1, 1, 0, 0, nil, nil, 100],
  ['app/assets/images/card_03.png', 'Boîtes de fer', 1, 2, 1, 1, 0, 0, 2, nil, nil, 100],
  ['app/assets/images/card_04.png', 'Brise-fémur', 1, 1, 2, 1, 2, 0, 0, nil, nil, 100],
  ['app/assets/images/card_05.png', 'Empaleurs franc', 2, 2, 2, 1, 2, 0, 1, nil, nil, 100],
  ['app/assets/images/card_06.png', 'Pourfendeurs de pance', 2, 2, 3, 1, 2, 0, 2, nil, nil, 100],
  ['app/assets/images/card_07.png', 'Dompteurs de chèvre', 1, 1, 1, 2, 0, 1, 0, nil, nil, 100],
  ['app/assets/images/card_08.png', 'Monteurs de sanglier', 2, 1, 2, 2, 0, 2, 0, nil, nil, 300],
  ['app/assets/images/card_09.png', 'Chevaucheurs de Taureau', 2, 1, 3, 2, 0, 2, 1, nil, nil, 300],
  ['app/assets/images/card_10.png', 'Sénéchal Dudéclin', 3, 3, 2, 2, 0, 2, 3, SpecialAbility.find_by(id: 7), nil, 500],
  ['app/assets/images/card_11.png', 'Chevalier sans repoche', 3, 4, 2, 1, 2, 0, 3, SpecialAbility.find_by(id: 8), nil, 500],
  ['app/assets/images/card_12.png', 'Sir Ost Pytal', 3, 4, 1, 2, 3, 2, 0, SpecialAbility.find_by(id: 3), nil, 500],
  ['app/assets/images/card_13.png', 'Dr Mééééé', 3, 6, 0, 1, 3, 0, 2, SpecialAbility.find_by(id: 4), nil, 500],
  ['app/assets/images/card_14.png', 'Mère Fouettard', 3, 3, 3, 1, 2, 1, 2, SpecialAbility.find_by(id: 5), nil, 500],
  ['app/assets/images/card_15.png', 'Contesse Terreur', 3, 2, 3, 2, 1, 2, 2, SpecialAbility.find_by(id: 6), nil, 500],
  # Duke carte n°16
  ['app/assets/images/card_16.png', 'Duke Con', 10, 0, 0, 0, 0, 0, nil, nil]
]

# Non pris en compte de l'image
card_list.each do |image, name, rarity, health_point, attack_point, move_point, wood_cost, food_cost, iron_cost, capacity1, capacity2, sell_price|
  c = Card.new(
    name: name, 
    rarity: rarity, 
    health_point: health_point, 
    attack_point: attack_point, 
    move_point: move_point, 
    wood_cost: wood_cost, 
    food_cost: food_cost, 
    iron_cost: iron_cost, 
    special_ability1: capacity1, 
    special_ability2: capacity2,
    sell_price: sell_price
  )
  
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
  k = KibrillesPack.new(
    kibrilles: kibrilles,
    euros: euros
  )
  k.save
end

Gacha_list = [
  ['app/assets/images/gacha.png', 'Heroes Heroes', true, 100, 1, 60, 30],
  ['app/assets/images/gacha.png', 'Champions Pack', false, 1000, 60, 30, 10],
  ['app/assets/images/gacha.png', 'Mads Pack', false, 100, 90, 8, 2]
]

Gacha_list.each do |image, name, kibrilles, price, rare1, rare2, rare3|
  g = Gacha.new(name: name, kibrilles: kibrilles, price: price, rare1: rare1, rare2: rare2, rare3: rare3)
  g.image = File.open(image)
  g.save
end

