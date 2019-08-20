class CreateCases < ActiveRecord::Migration[5.2]
  def change
    create_table :cases do |t|
      t.references :user, foreign_key: true
      t.integer :num_members
      t.string :guest_type
      t.string :household_preference
      t.text :special_notes
      t.string :image_url

      t.timestamps
    end
  end
end
