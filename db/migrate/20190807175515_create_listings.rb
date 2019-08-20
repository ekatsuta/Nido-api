class CreateListings < ActiveRecord::Migration[5.2]
  def change
    create_table :listings do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.string :address
      t.string :room_type
      t.integer :capacity
      t.text :description
      t.string :household_type
      t.string :guest_preference
      t.decimal :longitude
      t.decimal :latitude
      t.boolean :children

      t.timestamps
    end
  end
end
