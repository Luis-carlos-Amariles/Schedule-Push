class CreateTeacherByMatters < ActiveRecord::Migration
  def change
    create_table :teacher_by_matters do |t|
      t.references :matter, index: true, foreign_key: true
      t.references :room, index: true, foreign_key: true
      t.references :scheduled, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
