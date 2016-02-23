require 'spec_helper'

describe  UsersController do

          let(:user) { FactoryGirl.create(:user) }
          before  do
                  allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
          end

          describe  "GET #index" do

                    it  "assigns @users" do
                        all_users = User.all
                        get :index
                        expect(assigns(:users)).to eq(all_users)
                    end

                    it  "renders the :index view" do
                        get :index
                        expect(response).to render_template(:index)
                    end
          end


          describe  "GET #new" do
                    it  "assigns @user" do
                        get :new
                        expect(assigns(:user)).to be_instance_of(User)
                    end
                    it  "renders the :new view" do
                        get :new
                        expect(response).to render_template(:new)
                    end
          end

          describe  "POST #create" do

              context "password is invalid" do
                    it  "renders page with error" do
                        user = create(:user)
                        post :create, session: {email: user.email, password: 'invalid'}
                        expect(response).to render_template(:new)
                        expect(flash[:notice]).to match(/^Email and password do not match/)
                    end
              end

              context "password is valid" do
                    it  "logs user in and redirects to '/users/index'" do
                        user = create(:user)
                        post :create, session: {email: user.email, password: user.password}
                        expect(response).to redirect_to '/users/index'
                        expect(controller.current_user).to eq user
                    end
              end
              
              context "success" do
                    it  "creates a new user" do
                        users_count = users.count
                        post :create, user: {username: "blah", email: "blah", password: "blah"}
                        expect(users.count).to eq(users_count + 1)
                    end

                    it  "redirects to 'user_path' after successful create" do
                        post :create, user: {username: "blah", email: "blah", password: "blah"}
                        expect(response.status).to be(302)
                        expect(response.location).to match(/\/users\/\d+/)
                    end
              end

              context "failure" do
                    it  "redirects to 'new_user_path' when create fails" do
                        post :create, user: {username: nil, email: nil, password: nil}
                        expect(response).to redirect_to(new_user_path)
                    end
              end
          end


end
