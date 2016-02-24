class AddUserRefsToTeacherStudent < ActiveRecord::Migration
  def change
      remove_column :teacher_students, :user_id, :integer
      remove_column :teacher_students, :student_id, :integer
  end
end
