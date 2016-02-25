class TeacherStudentsController < ApplicationController

      def create
          @user = current_user
          @student = Student.find(params[:student_id])
          @user.students.push(@student)

          redirect_to current_user
        end
end
