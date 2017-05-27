class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.integer :code
      t.string :name
      t.integer :floor

      t.timestamps null: false
    end

    add_index :rooms, :code, unique: true
  end
end
