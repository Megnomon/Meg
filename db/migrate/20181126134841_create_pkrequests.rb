class CreatePkrequests < ActiveRecord::Migration[5.2]
  def change
    create_table :pkrequests do |t|
      t.integer :user_id
      t.integer :pkeyboard_id
      t.boolean :rent, default: false
      t.timestamps
    end
  end
end
