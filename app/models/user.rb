class User < ActiveRecord::Base
  as_secure_password
end
