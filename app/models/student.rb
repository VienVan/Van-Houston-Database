class Student < ActiveRecord::Base
      has_many :teacher_students
      has_many :users, through: :teacher_students
      validates_presence_of :first_name
      validates_presence_of :last_name
      validates_presence_of :email
      validates_presence_of :current_school
      validates_presence_of :grade_level
      mount_uploader :photo, AvatarUploader

      def self.search(query)
          where("last_name like ?", "%#{query}%")
          where("first_name like?", "%#{query}%")
          where("email like?", "%#{query}%")
          where("current_school like?", "%#{query}%")

        end

end
