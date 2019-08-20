class CreateListingProvisions < ActiveRecord::Migration[5.2]
  def change
    create_table :listing_provisions do |t|
      t.references :listing, foreign_key: true
      t.references :provision, foreign_key: true

      t.timestamps
    end
  end
end
