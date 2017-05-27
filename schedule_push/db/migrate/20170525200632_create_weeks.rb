class CreateWeeks < ActiveRecord::Migration
  def change
    create_table :weeks do |t|
      t.string :week_day
      t.integer :number_day

      t.timestamps null: false
    end
  end
end
