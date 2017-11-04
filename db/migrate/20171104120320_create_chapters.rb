class CreateChapters < ActiveRecord::Migration[5.0]
  def change
    create_table :chapters do |t|
      t.string :arabic_name,         null: false
      t.string :latin_name,          null: false
      t.string :city,                null: false
      t.string :english_translation, null: false

      t.timestamps                   null: false
    end
    add_index :chapters, :latin_name, unique: true
    add_index :chapters, :arabic_name, unique: true
  end
end
