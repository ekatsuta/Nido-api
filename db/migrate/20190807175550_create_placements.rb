class CreatePlacements < ActiveRecord::Migration[5.2]
  def change
    create_table :placements do |t|
      t.references :listing, foreign_key: true
      t.references :case, foreign_key: true
      t.string :period
      t.string :status
      t.boolean :checked

      t.timestamps
    end
  end
end
