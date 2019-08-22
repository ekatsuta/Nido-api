class Picture < ApplicationRecord
  belongs_to :listing

  def self.createLinks (imgArr, listing_id)
    imgArr.each do |image_url|
      self.create(image_url: image_url, listing_id: listing_id)
    end
  end

end
