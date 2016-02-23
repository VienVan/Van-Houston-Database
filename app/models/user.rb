class User < ActiveRecord::Base
      validates_presence_of :email
      validates_presence_of :username
      has_secure_password
end
