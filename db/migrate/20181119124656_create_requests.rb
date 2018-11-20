class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.string :artist
      t.string :songs
      t.string :part
      t.text :discription
      t.text :request
      t.integer :user_id
      t.integer :score_id
      t.timestamps
    end
  end
end
