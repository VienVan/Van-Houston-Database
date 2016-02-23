class CreateJoinTableAssociation < ActiveRecord::Migration
  def change
      change_table :teacher_students do |t|
          t.belongs_to :user, index: true
          t.belongs_to :student, index: true
      end
  end
end
