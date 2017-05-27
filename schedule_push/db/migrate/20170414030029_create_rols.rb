class CreateRols < ActiveRecord::Migration
  def change
    create_table :rols do |t|
      t.string :name
      t.integer :code

      t.timestamps null: false
    end

     add_index :rols, :code, unique: true
  end
end
