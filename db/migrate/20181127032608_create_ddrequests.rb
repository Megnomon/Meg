class CreateDdrequests < ActiveRecord::Migration[5.2]
  def change
    create_table :ddrequests do |t|
      t.integer :user_id
      t.integer :ddrum_id
      t.boolean :rent, default:false

      t.timestamps
    end
  end
end
