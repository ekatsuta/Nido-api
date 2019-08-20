class PlacementSerializer < ActiveModel::Serializer
  attributes :id, :period, :status, :listing_id, :case_id, :checked

end
