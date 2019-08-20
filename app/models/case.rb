class Case < ApplicationRecord
  belongs_to :user
  has_many :placements, dependent: :destroy
  has_many :listings, through: :placements
  has_many :language_cases, dependent: :destroy
  has_many :languages, through: :language_cases
end
