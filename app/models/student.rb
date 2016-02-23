class Student < ActiveRecord::Base
      has_many :teacher_students
      has_many :users, through: :teacher_students
      validates_presence_of :first_name
      validates_presence_of :last_name
      validates_presence_of :email
      validates_presence_of :current_school
      validates_presence_of :grade_level

end
