class CaseSerializer < ActiveModel::Serializer
  attributes :id, :num_members, :guest_type, :household_preference, :special_notes, :image_url, :created_at, :languages, :placements, :user
  has_many :language_cases, include_nested_associations: true
  # has_many :placements, include_nested_associations: true
  belongs_to :user


end
