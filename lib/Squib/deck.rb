require 'squib'
require 'game_icons'

Squib::Deck.new cards: 16, layout: 'custom_layout.yml' do
  background color: '#000000'
  deck = xlsx file: 'card.xlsx'
  text str: deck['name'], layout: 'title'
  text str: deck['title_description'], layout: 'title_description'
  text str: deck['description'], layout: 'description'
  png file: deck['art'], layout: 'art'

#  text str: 'Les Péons', layout: 'title'
#  svg layout: 'art'
#  text str: 'Récupération', layout: 'title_description'
#  text str: 'L’unité récolte la ressource de la case.', layout: 'description'

  # Bonus
  text str: deck['hp'], layout: 'hp'
  png file: 'image/glass-heart.png', layout: 'hpIcon'

  text str: deck['ap'], layout: 'ap'
  png file: 'image/pointy-sword.png', layout: 'apIcon'

  text str: deck['mp'], layout: 'mp'
  png file: 'image/walking-boot.png', layout: 'mpIcon'

  text str: deck['food'], layout: 'food'
  png file: 'image/meat.png', layout: 'foodIcon'

  text str: deck['rarity'], layout: 'rarity'
  png file: 'image/corporal.png', layout: 'rarityIcon'
#  text str: 'HP: 1', layout: 'hp'
#  text str: 'AP: 0', layout: 'ap'
#  text str: 'MP: 1', layout: 'mp'
#  text str: 'Food: 0', layout: 'food'
#  text str: 'Rarity: 1', layout: 'rarity'
#  svg layout: data['hpIcon']

  save_png prefix: 'card_'
end
