class CreateBoards < ActiveRecord::Migration
  def change
    create_table :boards do |t|
      t.string "title"
      t.references "user"
    end
  end
end
