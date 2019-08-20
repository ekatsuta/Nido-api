class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.string :name
      t.string :password_digest
      t.string :email
      t.text :description
      t.string :user_type
      t.string :profile_image

      t.timestamps
    end
  end
end
