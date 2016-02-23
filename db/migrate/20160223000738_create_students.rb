class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :current_school
      t.string :parent_first_name
      t.string :parent_last_name
      t.string :photo
      t.string :grade_level

      t.timestamps null: false
    end
  end
end
