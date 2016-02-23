require 'spec_helper'

describe  StudentsController do
          let(:student) { FactoryGirl.create(:student) }

          before  do
                  allow_any_instance_of(ApplicationController).to receive(:student).and_return(student)
          end

          describe  "GET #index" do
                    it  "assigns @students" do
                        all_students = Student.all
                        get :index
                        expect(assigns(:students)).to eq(all_students)
                      end

                    it  "renders the :index view" do
                        get :index
                        expect(response).to render_template(:index)
                    end
          end

          describe  "GET #new" do
                    it  "assigns @student" do
                        get :new
                        expect(assigns(:student)). to be_instance_of(Student)
                    end

                    it  "renders :new view" do
                        get :new
                        expect(response).to render_template(:new)
                    end
          end

          describe  "POST #create" do
              context "success" do
                    it  "adds new student" do
                        student_count = Student.count
                        post :create, student: {first_name: "blah", last_name: "blah", phone: 12312, current_school: "blah", grade_level: 1}
                        expect(Student.count).to eq(student_count + 1)
                    end

                    it  "redirects to 'student_path' after successful create" do
                        post :create, student: {first_name: "blah", last_name: "blah", phone: 12312, current_school: "blah", grade_level: 1}
                        expect(response.status).to be(302)
                        expect(response.location).to match(/\/students\/\d+/)
                    end
              end

              context "failure" do
                    it  "redirects to 'new_student_path' when create fails" do
                        post :create, student: {first_name: "blah", last_name: "blah", phone: 12312, current_school: "blah", grade_level: 1}
                        expect(response).to redirect_to(new_student_path)
                    end
              end
          end
end
