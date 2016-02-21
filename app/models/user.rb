class User < ActiveRecord::Base
    

  has_secure_password 
  acts_as_commontator
 
 
end
