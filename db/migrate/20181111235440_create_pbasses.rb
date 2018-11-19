class CreatePbasses < ActiveRecord::Migration[5.2]
  def change
    create_table :pbasses do |t|
      t.string :artist
      t.string :songs
      t.text :discription
      t.text :request
      t.integer :user_id
      t.timestamps
    end
  end
end
