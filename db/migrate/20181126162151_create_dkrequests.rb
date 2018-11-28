class CreateDkrequests < ActiveRecord::Migration[5.2]
  def change
    create_table :dkrequests do |t|
      t.integer :user_id
      t.integer :dkeyboard_id
      t.boolean :rent, default: false
      t.timestamps
    end
  end
end
