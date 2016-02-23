require 'spec_helper'

describe  UsersController do
          FactoryGirl.define do
              factory :user do
                      username "John"
                      email  "Doe"
                      password "12345"
              end
          end
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

  describe "GET #show"
  end

  describe "GET #new"
  end

  describe "POST #create"
  end

  describe "GET #edit"
  end

  describe "POST #update"

end
