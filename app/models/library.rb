class Library < ApplicationRecord
  belongs_to :user

  for i in 1..50 do
    validates "card_#{i}",
      numericality: {
        only_integer: true,
        greater_than_or_equal_to: 0
      },
      allow_blank: true
  end
end
