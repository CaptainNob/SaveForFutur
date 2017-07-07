class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable,
         :validatable, :confirmable, :lockable,
         :registerable, :timeoutable

  has_many :purchase_histories
  has_many :decks
  has_one  :library

  validates :username, presence: true,
                       length: { in: 4..25 },
                       uniqueness: { case_sensitive: true }
                 
  validates :avatar, presence: true
  
  validates :kibrilles, presence: true,
                        numericality: { only_integer: true, greater_than_or_equal_to: 0 }
                        
  validates :dingdings, presence: true,
                        numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def admin?
    self.admin
  end
end
