class CreatePgrequests < ActiveRecord::Migration[5.2]
  def change
    create_table :pgrequests do |t|
      t.integer :user_id
      t.integer :partscore_id
      t.boolean :rent, default: false
      t.timestamps
    end
  end
end
