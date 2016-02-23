FactoryGirl.define  do
            factory :user do
              sequence(:email) { |n| "g#{n}@g.com" }
                    password "testtest"
                    username "John"
            end
end
