class User < ActiveRecord::Base
      has_many :teacher_students
      has_many :students, through: :teacher_students
      validates_presence_of :email
      validates_presence_of :username
      has_secure_password
end
