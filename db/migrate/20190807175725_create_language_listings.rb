class CreateLanguageListings < ActiveRecord::Migration[5.2]
  def change
    create_table :language_listings do |t|
      t.references :listing, foreign_key: true
      t.references :language, foreign_key: true

      t.timestamps
    end
  end
end
