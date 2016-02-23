class CreateTeacherStudents < ActiveRecord::Migration
  def change
    create_table :teacher_students do |t|

      t.timestamps null: false
    end
  end
end
