class KibrillesPack < ApplicationRecord
  mount_uploader :pack_image, ImageUploader

  validates :kibrilles, presence: true, 
                        numericality: true
                    
  validates :euros, presence: true,
                    numericality: true
end
