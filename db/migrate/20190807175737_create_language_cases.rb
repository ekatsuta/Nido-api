class CreateLanguageCases < ActiveRecord::Migration[5.2]
  def change
    create_table :language_cases do |t|
      t.references :case, foreign_key: true
      t.references :language, foreign_key: true

      t.timestamps
    end
  end
end
