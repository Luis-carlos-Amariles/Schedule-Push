class CreateMatters < ActiveRecord::Migration
  def change
    create_table :matters do |t|
      t.integer :code
      t.string :name
      t.references :semester, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
