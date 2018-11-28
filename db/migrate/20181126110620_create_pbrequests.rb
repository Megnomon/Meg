class CreatePbrequests < ActiveRecord::Migration[5.2]
  def change
    create_table :pbrequests do |t|
      t.integer :user_id
      t.integer :pbass_id
      t.boolean :rent, default: false
      t.timestamps
    end
  end
end
