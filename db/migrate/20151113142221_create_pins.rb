class CreatePins < ActiveRecord::Migration
  def change
    create_table :pins do |t|

      t.timestamps null: false
      t.string "img_url"
      t.string "title"
      t.references "board"

    end
  end
end
