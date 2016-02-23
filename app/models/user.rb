class User < ActiveRecord::Base
      has_many :teacher_students
      has_many :students, through: :teacher_students
      validates_presence_of :email
      validates_presence_of :username
      validates_confirmation_of :password
      has_secure_password

      def self.confirm(params)
          @user = User.find_by({email: params[:email]})
          @user.try(:authenticate, params[:password])
      end
end
