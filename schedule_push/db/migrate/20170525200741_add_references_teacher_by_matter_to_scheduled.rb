class AddReferencesTeacherByMatterToScheduled < ActiveRecord::Migration
  def change
    add_reference :scheduleds, :week, index: true, foreign_key: true
  end
end
