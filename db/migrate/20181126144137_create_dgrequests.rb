class CreateDgrequests < ActiveRecord::Migration[5.2]
  def change
    create_table :dgrequests do |t|
      t.integer :user_id
      t.integer :dictation_id
      t.boolean :rent, default: false
      t.timestamps
    end
  end
end
