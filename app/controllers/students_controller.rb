class StudentsController < ApplicationController


      def index
          @students = Student.all
          if params[:search]
              @students = Student.search(params[:search]).order("created_at DESC")
          else
              @students = Student.order("created_at DESC")
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
              redirect_to student_path(@student)
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
          redirect_to student_path(@student)
      end

      private
      def student_params
          student_params = params.require(:student).permit(:first_name, :last_name, :email, :parent_first_name, :parent_last_name, :photo, :current_school, :grade_level)
      end
end
