class CreateDcrequests < ActiveRecord::Migration[5.2]
  def change
    create_table :dcrequests do |t|
      t.integer :user_id
      t.integer :dchorus_id
      t.boolean :rent, default: false
      t.timestamps
    end
  end
end
