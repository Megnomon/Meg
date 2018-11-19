class CreateTweets < ActiveRecord::Migration[5.2]
  def change
    create_table :tweets do |t|
      t.string :artist
      t.string :songs
      t.string :part
      t.text :discription
      t.text :request
      t.timestamps
    end
  end
end
