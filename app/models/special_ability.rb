class SpecialAbility < ApplicationRecord
  has_many :card
  
  validates :name, presence: true
  validates :effect, presence: true
end
