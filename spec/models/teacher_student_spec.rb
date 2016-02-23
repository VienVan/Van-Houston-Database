require 'spec_helper'

describe TeacherStudent do
        it {should belong_to(:student)}
        it {should belong_to(:user)}
end
