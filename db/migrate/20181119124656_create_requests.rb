class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.integer :user_id
      t.integer :tweet_id
      t.boolean :rent, default: false
      t.timestamps
    end
  end
end
