class AddUserRefs < ActiveRecord::Migration
  def change
      add_reference :teacher_students, :user, index: true, foreign_key: true
      add_reference :teacher_students, :student, index: true, foreign_key: true
  end
end
