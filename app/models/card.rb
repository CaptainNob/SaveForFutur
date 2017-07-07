class Card < ApplicationRecord
  mount_uploader :image, ImageUploader
  
  belongs_to :special_ability1, class_name: 'SpecialAbility', foreign_key: :special_ability1_id
  belongs_to :special_ability2, class_name: 'SpecialAbility', foreign_key: :special_ability2_id
  
  validates :image, presence: true
  validates :name, presence: true
  validates :rarity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 3 }
  validates :health_point, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates :attack_point, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :move_point, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates :wood_cost, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :food_cost, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :iron_cost, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
