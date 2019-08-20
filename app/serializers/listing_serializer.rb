class ListingSerializer < ActiveModel::Serializer
  attributes :id, :title, :address, :room_type, :capacity, :description, :household_type, :guest_preference, :pictures, :languages, :user, :provisions, :placements, :longitude, :latitude
  has_many :pictures, include_nested_associations: true
  has_many :language_listings, include_nested_associations: true
  has_many :listing_provisions, include_nested_associations: true
  belongs_to :user

end
