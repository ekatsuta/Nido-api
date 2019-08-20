class LanguageCase < ApplicationRecord
  belongs_to :case
  belongs_to :language

  validates_uniqueness_of :language_id, :scope => :listing_id
  
end
