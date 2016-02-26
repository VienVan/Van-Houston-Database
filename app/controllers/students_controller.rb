class StudentsController < ApplicationController


      def index
          @students = Student.all
          @student = Student.new
          if params[:search]
              @students = Student.search(params[:search]).order("first_name ASC")
          else
              @students = Student.order("first_name ASC")
          end
      end

      def show
          @student = Student.find(params[:id])
      end

      def new
          @student = Student.new
      end

      def create
          @student = Student.new(student_params)
          if  @student.save
              if current_user
                redirect_to students_path
              else
                redirect_to '/'
              end
          else
              redirect_to new_student_path
          end
      end

      def edit
          @student = Student.find(params[:id])
      end

      def update
          @student = Student.find(params[:id])
          update_params = params.require(:student).permit(:email, :grade_level, :current_school, :photo, :student_id)
          @student.update_attributes(update_params)
          redirect_to students_path
      end

      private
      def student_params
          student_params = params.require(:student).permit(:first_name, :last_name, :email, :parent_first_name, :parent_last_name, :photo, :current_school, :grade_level)
      end
end
