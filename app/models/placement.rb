class Placement < ApplicationRecord
  belongs_to :listing
  belongs_to :case

  validates :listing_id, presence: true
  validates :case_id, presence: true
  validates :period, presence: true


end
