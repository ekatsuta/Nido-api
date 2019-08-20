class Listing < ApplicationRecord
  belongs_to :user
  has_many :pictures, dependent: :destroy
  has_many :language_listings, dependent: :destroy
  has_many :languages, through: :language_listings
  has_many :listing_provisions, dependent: :destroy
  has_many :provisions, through: :listing_provisions
  has_many :placements, dependent: :destroy

  def self.checkOverlap(placementsArr, placement)
    other_start_date = Date.parse(placement.period.split(",")[0])
    other_end_date = Date.parse(placement.period.split(",")[1])
    placementsArr.any? do |previousPlacement|
      start_date = Date.parse(previousPlacement.period.split(",")[0])
      end_date = Date.parse(previousPlacement.period.split(",")[1])
      previousPlacement.status === "approved" &&start_date <= other_end_date && other_start_date <= end_date
    end
  end
end
