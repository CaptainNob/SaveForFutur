class PurchaseHistory < ApplicationRecord
  belongs_to :user
  
  validates :kibrilles, presence: true, 
                        numericality: {
                          only_integer: true,
                          greater_than_or_equal_to: 1
                        }
                    
  validates :euros, presence: true,
                    numericality: { greater_than_or_equal_to: 0 }
end
