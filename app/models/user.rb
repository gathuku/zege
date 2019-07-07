class User < ApplicationRecord
   has_secure_password
  validates :name, :email, presence:true
  validates :password, presence:true, length:{minimum:6}, on: :create

end
