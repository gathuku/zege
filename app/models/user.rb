class User < ApplicationRecord
  has_secure_password

  validates :name, :email, presence:true
  validates :password, presence:true , length:{minimum:8}


  def create_user_session(email,password)
    @user=User.find_by(email: email).first
    #assign authentication_token
    @user.authentication_token=SecureRandom.alphanumeric

     if @user && @user.authenticate(password)
        #save overwrite token
        @user.save
     end
    @user.save
  end

 # accepts token to destroy
  def destroy_user_session(token)
   user=User.find_by(authentication_token: token)
   if user
     user.authentication_token=nil
     user.save
   end
  end

 def create_new_user(name,email,password,password_confirmation)
   
 end

end
