require 'spec_helper'

describe User do

        subject(:user) { FactoryGirl.create(:user) }
        it { should validate_presence_of(:email) }
        it { should validate_presence_of(:username) }
        it { should validate_presence_of(:password) }
        it {should have_many(:students).through(:teacher_students)}

end
