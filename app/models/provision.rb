class Provision < ApplicationRecord
  has_many :listing_provisions
  has_many :listings, through: :listing_provisions

  def self.createLinks (provisionsArr, listing_id)
    provisionsArr.each do |provision|
      foundProvision = Provision.find_by(provision: provision)
      ListingProvision.create(provision_id: foundProvision.id, listing_id: listing_id)
    end
  end

end
