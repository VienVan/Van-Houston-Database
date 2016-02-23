require 'spec_helper'

describe Student do

        it {should validate_presence_of(:first_name)}
        it {should validate_presence_of(:last_name)}
        it {should validate_presence_of(:grade_level)}
        it {should validate_presence_of(:current_school)}
        it {should have_many(:users).through(:teacher_students)}

end
