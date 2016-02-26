class ChangeColumn < ActiveRecord::Migration
  def change
    change_column :users, :phone, :string
    change_column :students, :grade_level, :string
  end
end
