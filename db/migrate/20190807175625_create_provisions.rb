class CreateProvisions < ActiveRecord::Migration[5.2]
  def change
    create_table :provisions do |t|
      t.string :provision
      t.string :icon_image

      t.timestamps
    end
  end
end
