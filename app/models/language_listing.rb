class LanguageListing < ApplicationRecord
  belongs_to :listing
  belongs_to :language

  validates_uniqueness_of :language_id, :scope => :listing_id
  
end
