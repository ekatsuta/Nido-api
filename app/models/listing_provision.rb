class ListingProvision < ApplicationRecord
  belongs_to :listing
  belongs_to :provision

  validates_uniqueness_of :listing_id, :scope => :provision_id
end
