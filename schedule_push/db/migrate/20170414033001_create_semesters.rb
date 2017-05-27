class CreateSemesters < ActiveRecord::Migration
  def change
    create_table :semesters do |t|
      t.integer :number
      t.string :level

      t.timestamps null: false
    end
  end
end
