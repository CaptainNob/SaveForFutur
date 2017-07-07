class Gacha < ApplicationRecord
  mount_uploader :image, ImageUploader

  validates :name, presence: true, length: { maximum: 25 }
  validates :price,
    presence: true,
    numericality: {
      only_integer: true,
      greater_than_or_equal_to: 0
    }
  for i in 1..3 do
    validates "rare#{i}",
      numericality: {
        greater_than_or_equal_to: 0
      },
      allow_blank: true
  end
end
