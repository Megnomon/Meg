class CreatePdrequests < ActiveRecord::Migration[5.2]
  def change
    create_table :pdrequests do |t|
      t.integer :user_id
      t.integer :pdrum_id
      t.boolean :rent, default: false
      t.timestamps
    end
  end
end
