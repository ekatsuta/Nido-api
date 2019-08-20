class Language < ApplicationRecord
  has_many :language_listings
  has_many :language_cases
  has_many :listings, through: :language_listings
  has_many :cases, through: :language_cases

  def self.createLinks (languageArr, listing_id)
    languageArr.each do |language|
      foundLanguage = Language.find_by(language: language)
      LanguageListing.create(language_id: foundLanguage.id, listing_id: listing_id)
    end
  end

end
